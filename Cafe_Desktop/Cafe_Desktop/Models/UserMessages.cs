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
            string ukrMessage = "Все погано!";

            ShowError(ukrMessage, DefaultTitle);
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

        public static void ShowBlankMandatoryField()
        {
            string message = "Не все обязательные поля заполнены";

            ShowExclamation(message, DefaultTitle);
        }

        public static void ShowOrderCreated()
        {
            string message = "Заказ успешно создан";

            ShowInfo(message, DefaultTitle);
        }
    }
}
