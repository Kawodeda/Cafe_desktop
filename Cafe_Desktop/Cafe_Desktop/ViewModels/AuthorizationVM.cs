using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

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
                        var passwordBox = x as PasswordBox;
                        if (passwordBox != null)
                        {
                            string password = passwordBox.Password;
                            switch (Authorization.Login(_username, password))
                            {
                                case AuthorizationStatus.Success:
                                    Username = "";
                                    passwordBox.Password = "";
                                    break;
                                case AuthorizationStatus.UserDoesNotExist:
                                    UserMessages.ShowUserDoesNotExist(_username);
                                    break;
                                case AuthorizationStatus.IncorrectPassword:
                                    UserMessages.ShowIncorrectPassword();
                                    break;
                                case AuthorizationStatus.Error:
                                    UserMessages.ShowUnknownError();
                                    break;
                            }
                        }
                        else
                        {
                            UserMessages.ShowUnknownError();
                        }
                    }, (x) =>
                    {
                        var passwordBox = x as PasswordBox;
                        if(passwordBox == null)
                        {
                            return false;
                        }

                        string password = passwordBox.Password;
                        return password != "" && _username != "";
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
