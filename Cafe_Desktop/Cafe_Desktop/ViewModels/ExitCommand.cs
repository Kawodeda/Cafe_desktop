using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.ViewModels
{
    public class ExitCommand : RelayCommand
    {
        public ExitCommand()
            : base((x) =>
            {
                App.Current.Shutdown();
            })
        {

        }
    }
}
