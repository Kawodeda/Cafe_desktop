using Cafe_Desktop.Models;
using Cafe_Desktop.Views;

namespace Cafe_Desktop.ViewModels
{
    public class WaiterVM : RetrieveUpdateOrdersVM
    {
        private RelayCommand _addOrderCommand;

        public RelayCommand AddOrderCommand
        {
            get
            {
                return _addOrderCommand
                    ?? (_addOrderCommand = new RelayCommand((x) =>
                    {
                        Order order;
                        new AddOrderWindow(out order).ShowDialog();
                        _retrieveOrdersVM.Orders.Add(order);
                    }));
            }
        }
    }
}
