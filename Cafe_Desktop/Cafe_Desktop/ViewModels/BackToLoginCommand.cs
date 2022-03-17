using Cafe_Desktop.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Cafe_Desktop.ViewModels
{
    public class BackToLoginCommand : RelayCommand
    {
        public BackToLoginCommand()
            : base((x) =>
            {
                new AuthorizationWindow().Show();

                var window = x as Window;
                if(window != null)
                {
                    window.Close();
                }
            })
        {

        }
    }
}
