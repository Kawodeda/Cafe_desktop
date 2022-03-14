using Cafe_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.ViewModels
{
    internal class OrderVM : Notifier, ICookOrderVM
    {
        private bool _isCooking;
        private bool _isCooked;

        public bool IsCooking
        {
            get => _isCooking;
            set
            {
                _isCooking = value;
                RaisePropertyChanged();
            }
        }

        public bool IsCooked
        {
            get => _isCooked;
            set
            {
                _isCooked = value;
                RaisePropertyChanged();
            }
        }

        public void Update(Order? order)
        {
            switch(order?.OrderStatusId)
            {
                case 2:
                    IsCooking = true;
                    IsCooked = false;
                    break;
                case 3:
                    IsCooking = false;
                    IsCooked = true;
                    break;
                default:
                    IsCooking = false;
                    IsCooked = false;
                    break;
            }
        }
    }
}
