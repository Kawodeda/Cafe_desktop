using Cafe_Desktop.Models;

namespace Cafe_Desktop.ViewModels
{
    public class UserPersonalAreaVM
    {
        public const string UserWelcomeTemplate = "Добро пожаловать, {0}!";

        public string UserWelcome
        {
            get
            {
                return string.Format(UserWelcomeTemplate, Authorization.CurrentUser?.Login);
            }
        }
    }
}
