using Cafe_Desktop.ViewModels;
using System;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace Cafe_Desktop.Converters
{
    public class LoginParamsConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo cultureInfo)
        {
            if(values.Count() == 2)
            {
                var passwordBox = values[0] as PasswordBox;
                var window = values[1] as Window;

                if(passwordBox != null && window != null)
                {
                    return new LoginCommandParams() { PasswordBox = passwordBox, Window = window};
                }
                else
                {
                    throw new ArgumentNullException();
                }
            }
            else
            {
                throw new ArgumentException();
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo cultureInfo)
        {
            throw new NotImplementedException();
        }
    }
}
