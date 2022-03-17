using Cafe_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.ViewModels
{
    internal class OrderVM : Notifier, ICookOrderVM, IWaiterOrderVM
    {
        private bool _isCooking;
        private bool _isCooked;
        private bool _isRecieved;
        private bool _isPaid;

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

        public bool IsRecieved
        {
            get => _isRecieved;
            set
            {
                _isRecieved = value;
                RaisePropertyChanged();
            }
        }

        public bool IsPaid
        {
            get => _isPaid;
            set
            {
                _isPaid = value;
                RaisePropertyChanged();
            }
        }

        public void Update(Order? order)
        {
            IsRecieved = false;
            IsCooking = false;
            IsCooked = false;
            IsPaid = false;

            switch(order?.OrderStatusId)
            {
                case 1:
                    IsRecieved = true;
                    break;
                case 2:
                    IsCooking = true;
                    break;
                case 3:
                    IsCooked = true;
                    break;
                case 4:
                    IsPaid = true;
                    break;
            }
        }
    }
}
