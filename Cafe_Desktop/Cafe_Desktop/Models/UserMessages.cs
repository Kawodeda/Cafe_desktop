using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.Models
{
    public class UserMessages : BaseUserMessages
    {
        public const string DefaultTitle = "";

        public static void ShowUnknownError()
        {
            string message = "Произошла непредвиденная ошибка";

            ShowError(message, DefaultTitle);
        }

        public static void ShowUserDoesNotExist(string username)
        {
            string message = $"Пользователя с именем {username} не существует";

            ShowExclamation(message, DefaultTitle);
        }

        public static void ShowIncorrectPassword()
        {
            string message = "Введен неверный пароль";

            ShowExclamation(message, DefaultTitle);
        }
    }
}
