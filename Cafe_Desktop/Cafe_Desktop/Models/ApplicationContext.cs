using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

namespace Cafe_Desktop.Models
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Dish> Dish { get; set; }
        public DbSet<Reserve> Reserve { get; set; }
        public DbSet<Place> Place { get; set; }
        public DbSet<OrderStatus> OrderStatus { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<Post> Post { get; set; }

        public ApplicationContext()
        {
            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data source=mssql;Database=gr602_chuded;Trusted_Connection=True");
        }
    }
}
