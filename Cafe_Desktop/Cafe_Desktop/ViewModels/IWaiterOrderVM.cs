using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.ViewModels
{
    public interface IWaiterOrderVM : IOrderUpdatable
    {
        public bool IsRecieved { get; set; }
        public bool IsPaid { get; set; }
    }
}
