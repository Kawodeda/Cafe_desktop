using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Globalization;
using System.Windows.Controls;
using Cafe_Desktop.ViewModels;

namespace Cafe_Desktop.Converters
{
    public class UpdateStatusConverter : IMultiValueConverter
    {
        public object? Convert(object[] values, Type targetType, object parameter, CultureInfo cultureInfo)
        {
            IEnumerable<RadioButton?> radioButtons = values.Select(x => x as RadioButton);

            return radioButtons == null ? null : new UpdateStatusCommandParams() 
            { 
                RadioButtons = radioButtons.ToList() 
            };
        }

        public object[] ConvertBack(object value, Type[] targetType, object parameter, CultureInfo cultureInfo)
        {
            throw new NotImplementedException();
        }
    }
}
