using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cafe_Desktop.ViewModels;

namespace Cafe_Desktop.Models
{
    public class Order : Notifier
    {
        private int _orderStatusId;
        private OrderStatus _orderStatus;

        public int Id { get; set; }
        public int UserId { get; set; }
        public int PlaceId { get; set; }
        public int OrderStatusId 
        {
            get => _orderStatusId;
            set
            {
                _orderStatusId = value;
                RaisePropertyChanged();
            }
        }
        public DateTime Created { get; set; }
        public User User { get; set; }
        public Place Place { get; set; }
        public OrderStatus OrderStatus 
        {
            get => _orderStatus;
            set
            {
                _orderStatus = value;
                RaisePropertyChanged();
            }
        }
        public ICollection<Reserve> Reserve { get; set; }
    }
}
