using Cafe_Desktop.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Cafe_Desktop.ViewModels
{
    public class WaiterVM : Notifier
    {
        public const string UserWelcomeTemplate = "Добро пожаловать, {0}!";

        private ObservableCollection<Order> _orders;
        private Order _selectedOrder;
        private IWaiterOrderVM _selectedOrderVM;
        private bool _statusChangingEnabled;
        private RelayCommand _updateOrderCommand;
        private RelayCommand _backCommand;

        public WaiterVM()
        {
            LoadOrders();
            _selectedOrderVM = new OrderVM();
        }

        public ObservableCollection<Order> Orders
        {
            get => _orders;
        }

        public Order SelectedOrder
        {
            get => _selectedOrder;
            set
            {
                _selectedOrder = value;
                _selectedOrderVM.Update(_selectedOrder);
                StatusChangingEnabled = _selectedOrder != null;
                RaisePropertyChanged();
            }
        }

        public IWaiterOrderVM SelectedOrderVM
        {
            get => _selectedOrderVM;
        }

        public bool StatusChangingEnabled
        {
            get => _statusChangingEnabled;
            private set
            {
                _statusChangingEnabled = value;
                RaisePropertyChanged();
            }
        }

        public RelayCommand UpdateOrderCommand
        {
            get
            {
                return _updateOrderCommand
                    ?? (_updateOrderCommand = new RelayCommand((x) =>
                    {
                        var parameter = x as UpdateStatusCommandParams;
                        if (parameter != null)
                        {
                            RadioButton? checkedRadioButton = parameter.RadioButtons.Find(x => x.IsChecked == true);
                            if (checkedRadioButton != null)
                            {
                                var info = checkedRadioButton.Tag as UpdateStatusInfo;
                                if (info != null)
                                {
                                    UpdateOrderStatus(_selectedOrder, info);
                                }
                            }
                        }
                    }, (x) =>
                    {
                        return _selectedOrder != null;
                    }));
            }
        }

        public RelayCommand BackCommand
        {
            get
            {
                return _backCommand ?? (_backCommand = new BackToLoginCommand());
            }
        }

        private void UpdateOrderStatus(Order order, UpdateStatusInfo updateStatusInfo)
        {
            order.OrderStatusId = updateStatusInfo.OrderStatusId;
            order.OrderStatus = DbContextProvider.Context.OrderStatus.Find(order.OrderStatusId);
            DbContextProvider.Context.SaveChanges();
        }

        private void LoadOrders()
        {
            _orders = new ObservableCollection<Order>(
                DbContextProvider.Context.Order
                    .Include(x => x.OrderStatus)
                    .Include(x => x.Reserve)
                    .ThenInclude(x => x.Dish));
        }
    }
}
