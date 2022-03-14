﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using Cafe_Desktop.Models;

namespace Cafe_Desktop.ViewModels
{
    public class CookVM : Notifier
    {
        public const string UserWelcomeTemplate = "Добро пожаловать, {0}!";

        private ObservableCollection<Order> _orders;
        private Order _selectedOrder;
        private ICookOrderVM _selectedOrderVM;
        private bool _statusChangingEnabled;

        public CookVM()
        {
            LoadOrders();
            _selectedOrderVM = new OrderVM();
        }

        public ObservableCollection<Order> Orders
        {
            get => _orders;
        }

        public Order SelectedOrder
        {
            get => _selectedOrder;
            set
            {
                _selectedOrder = value;
                _selectedOrderVM.Update(_selectedOrder);
                StatusChangingEnabled = _selectedOrder != null;
                RaisePropertyChanged();
            }
        }

        public ICookOrderVM SelectedOrderVM
        {
            get => _selectedOrderVM;
        }

        public bool StatusChangingEnabled
        {
            get => _statusChangingEnabled;
            private set
            {
                _statusChangingEnabled = value;
                RaisePropertyChanged();
            }
        }

        public string UserWelcome
        {
            get
            {
                return string.Format(UserWelcomeTemplate, Authorization.CurrentUser?.Login);
            }
        }

        private void LoadOrders()
        {
            //_orders = new ObservableCollection<Order>(DbContextProvider.Context.Order);
            _orders = new ObservableCollection<Order>() 
            { 
                new Order() 
                { 
                    Id = 1, 
                    OrderStatusId = 1,
                    OrderStatus = new OrderStatus() {Id = 1, Title = "принят"},
                    Place = new Place() { Title = "Столик 4"},
                    Reserve = new List<Reserve>() 
                    { 
                        new Reserve() {Dish = new Dish() { Title = "Йеаай"} },
                        new Reserve() {Dish = new Dish() { Title = "Чай"} }
                    }
                },
                new Order()
                {
                    Id = 2,
                    OrderStatusId = 1,
                    OrderStatus = new OrderStatus() {Id = 1, Title = "принят"},
                    Place = new Place() { Title = "Столик 5"},
                    Reserve = new List<Reserve>()
                    {
                        new Reserve() {Dish = new Dish() { Title = "упити (upiti)"} },
                        new Reserve() {Dish = new Dish() { Title = "етите (etite)"} },
                        new Reserve() {Dish = new Dish() { Title = "акоке (akoke)"} }
                    }
                },
                new Order()
                {
                    Id = 2,
                    OrderStatusId = 2,
                    OrderStatus = new OrderStatus() {Id = 2, Title = "готовится"},
                    Place = new Place() { Title = "Столик 1"},
                    Reserve = new List<Reserve>()
                    {
                        new Reserve() {Dish = new Dish() { Title = "акоке (akoke)"} },
                        new Reserve() {Dish = new Dish() { Title = "акоке (akoke)"} },
                        new Reserve() {Dish = new Dish() { Title = "акоке (akoke)"} },
                        new Reserve() {Dish = new Dish() { Title = "акоке (akoke)"} }
                    }
                }
            };
        }
    }
}