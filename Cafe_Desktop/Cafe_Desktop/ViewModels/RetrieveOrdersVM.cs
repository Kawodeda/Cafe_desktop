using Cafe_Desktop.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;

namespace Cafe_Desktop.ViewModels
{
    public class RetrieveOrdersVM
    {
        private ObservableCollection<Order> _orders;

        public RetrieveOrdersVM()
        {
            LoadOrders();
        }

        public ObservableCollection<Order> Orders
        {
            get => _orders;
        }

        private void LoadOrders()
        {
            _orders = new ObservableCollection<Order>(
                DbContextProvider.Context.Order
                    .Include(x => x.OrderStatus)
                    .Include(x => x.Place)
                    .Include(x => x.Reserve)
                    .ThenInclude(x => x.Dish));
        }
    }
}
