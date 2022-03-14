using Cafe_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.ViewModels
{
    public interface ICookOrderVM : IOrderUpdatable
    {
        public bool IsCooking { get; set; }
        public bool IsCooked { get; set; }        
    }
}
