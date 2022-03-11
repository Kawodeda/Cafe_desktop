using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int PlaceId { get; set; }
        public int OrderStatusId { get; set; }
        public DateTime Created { get; set; }
        public User User { get; set; }
        public Place Place { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public ICollection<Reserve> Reserve { get; set; }
    }
}
