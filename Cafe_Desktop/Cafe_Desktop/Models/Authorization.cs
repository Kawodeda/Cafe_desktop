using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.Models
{
    public class Authorization
    {
        private static User _currentUser;
        public static bool IsAuthorized { get; private set; }
        public static User? CurrentUser 
        { 
            get
            {
                return IsAuthorized ? _currentUser : null;
            }
        }

        public static AuthorizationStatus Login(string username, string password)
        {           
            try
            {
                User user = DbContextProvider.Context.User.Include(x => x.Post).ToList().Find(x => x.Login == username);
                //User user = new List<User>() { new User() { Login = "KawoDeda", Password = "12345", PostId = 1} }.Find(x => x.Login == username);

                if (user == null)
                {
                    return AuthorizationStatus.UserDoesNotExist;
                }
                else
                {
                    if(user.Password == password)
                    {
                        IsAuthorized = true;
                        _currentUser = user;
                        return AuthorizationStatus.Success;
                    }
                    else
                    {
                        return AuthorizationStatus.IncorrectPassword;
                    }
                }
            }
            catch
            {
                return AuthorizationStatus.Error;
            }
        }

        public static void Logout()
        {
            IsAuthorized = false;
        }
    }

    public enum AuthorizationStatus
    {
        Success,
        UserDoesNotExist,
        IncorrectPassword,
        Error
    }
}
