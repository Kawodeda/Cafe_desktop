using Cafe_Desktop.Models;
using System.Windows.Controls;

namespace Cafe_Desktop.ViewModels
{
    public class UpdateOrderVM : Notifier
    {
        private Order _selectedOrder;
        private IWaiterOrderVM _selectedOrderVM;
        private bool _statusChangingEnabled;
        private RelayCommand _updateOrderCommand;

        public UpdateOrderVM()
        {
            _selectedOrderVM = new OrderVM();
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

        private void UpdateOrderStatus(Order order, UpdateStatusInfo updateStatusInfo)
        {
            order.OrderStatusId = updateStatusInfo.OrderStatusId;
            order.OrderStatus = DbContextProvider.Context.OrderStatus.Find(order.OrderStatusId);
            DbContextProvider.Context.SaveChanges();
        }
    }
}
