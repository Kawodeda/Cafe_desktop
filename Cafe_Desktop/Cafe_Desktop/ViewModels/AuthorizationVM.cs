using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

using Cafe_Desktop.Models;

namespace Cafe_Desktop.ViewModels
{
    public class AuthorizationVM : Notifier
    {
        private string _username;
        private RelayCommand _loginCommand;
        private RelayCommand _exitCommand;

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                RaisePropertyChanged();
            }
        }

        public RelayCommand LoginCommand
        {
            get
            {
                return _loginCommand ?? 
                    (_loginCommand = new RelayCommand((x) =>
                    { 

                    }));
            }
        }

        public RelayCommand ExitCommand
        {
            get
            {
                return _exitCommand ??
                    (_exitCommand = new RelayCommand((x) =>
                    {
                        App.Current.Shutdown();
                    }));
            }
        }
    }
}
