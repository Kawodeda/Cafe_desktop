using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using Cafe_Desktop.Models;
using Microsoft.EntityFrameworkCore;

namespace Cafe_Desktop.ViewModels
{
    public class CookVM : Notifier
    {
        public const string UserWelcomeTemplate = "Добро пожаловать, {0}!";

        private ObservableCollection<Order> _orders;
        private Order _selectedOrder;
        private ICookOrderVM _selectedOrderVM;
        private bool _statusChangingEnabled;
        private RelayCommand _updateOrderCommand;

        public CookVM()
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

        public ICookOrderVM SelectedOrderVM
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
                        
                    }, (x) =>
                    {
                        return _selectedOrder != null;
                    }));
            }
        }

        public string UserWelcome
        {
            get
            {
                return string.Format(UserWelcomeTemplate, Authorization.CurrentUser?.Login);
            }
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
