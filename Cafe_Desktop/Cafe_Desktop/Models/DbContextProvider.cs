using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Desktop.Models
{
    public class DbContextProvider
    {
        public static ApplicationContext Context { get; } = new ApplicationContext();
    }
}
