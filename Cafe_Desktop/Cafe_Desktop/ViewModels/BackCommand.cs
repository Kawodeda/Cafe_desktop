using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Cafe_Desktop.ViewModels
{
    public class BackCommand : RelayCommand
    {
        public BackCommand()
            : base((x) =>
            {
                var window = x as Window;
                if (window != null)
                {
                    window.Close();
                }
            })
        {

        }
    }
}
