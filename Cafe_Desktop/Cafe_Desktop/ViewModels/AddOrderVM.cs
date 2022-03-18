using Cafe_Desktop.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Cafe_Desktop.ViewModels
{
    public class AddOrderVM : Notifier
    {
        private ObservableCollection<Dish> _dishes;
        private ObservableCollection<Reserve> _reserves;
        private ObservableCollection<Place> _places;
        private Dish _selectedDish;
        private Reserve _selectedReserve;
        private Place _selectedPlace;
        private RelayCommand _addCommand;
        private RelayCommand _removeCommand;
        private RelayCommand _submitCommand;
        private RelayCommand _backCommand;

        public AddOrderVM()
        {
            LoadDishes();
            LoadPlaces();            
            _reserves = new ObservableCollection<Reserve>();
            Order = new Order();
            ClearEntries();
        }

        public Order Order { get; private set; }

        public ObservableCollection<Dish> Dishes
        {
            get => _dishes;
        }

        public ObservableCollection<Reserve> Reserves
        {
            get => _reserves;
        }

        public ObservableCollection <Place> Places
        {
            get => _places;
        }

        public Dish SelectedDish
        {
            get => _selectedDish;
            set
            {
                _selectedDish = value;
                RaisePropertyChanged();
            }
        }

        public Reserve SelectedReserve
        {
            get => _selectedReserve;
            set
            {
                _selectedReserve = value;
                RaisePropertyChanged();
            }
        }

        public Place SelectedPlace
        {
            get => _selectedPlace;
            set
            {
                _selectedPlace = value;
                RaisePropertyChanged();
            }
        }

        public string CurrentUserName
        {
            get => Authorization.CurrentUser.Login;
        }

        public RelayCommand AddCommand
        {
            get
            {
                return _addCommand
                    ?? (_addCommand = new RelayCommand((x) =>
                    {
                        _reserves.Add(CreateReserve(_selectedDish));
                    }, (x) =>
                    {
                        return _selectedDish != null;
                    }));
            }
        }
        public RelayCommand RemoveCommand
        {
            get
            {
                return _removeCommand
                    ?? (_removeCommand = new RelayCommand((x) =>
                    {
                        _reserves.Remove(_selectedReserve);
                    }, (x) =>
                    {
                        return _selectedReserve != null;
                    }));
            }
        }

        public RelayCommand SubmitCommand
        {
            get 
            { 
                return _submitCommand
                    ?? (_submitCommand = new RelayCommand((x) =>
                    {
                        try
                        {
                            Order.OrderStatusId = 1;
                            Order.Place = _selectedPlace;
                            Order.PlaceId = _selectedPlace.Id;
                            Order.User = Authorization.CurrentUser;
                            Order.UserId = Authorization.CurrentUser.Id;
                            Order.Reserve = _reserves;
                            Order.Created = DateTime.Now;

                            DbContextProvider.Context.Order.Add(Order);
                            DbContextProvider.Context.Reserve.AddRange(_reserves);
                            DbContextProvider.Context.SaveChanges();
                            ClearEntries();
                            UserMessages.ShowOrderCreated();

                            var window = x as Window;
                            window?.Close();
                        }
                        catch
                        {
                            UserMessages.ShowUnknownError();
                        }
                    }, (x) =>
                    {
                        return _reserves.Count > 0;
                    })); 
            }
        }

        public RelayCommand BackCommand
        {
            get 
            { 
                return _backCommand ?? (_backCommand = new BackCommand()); 
            }
        }

        private Reserve CreateReserve(Dish dish)
        {
            return new Reserve() { DishId = dish.Id, Dish = dish};
        }

        private void LoadDishes()
        {
            _dishes = new ObservableCollection<Dish>(DbContextProvider.Context.Dish);
        }

        private void LoadPlaces()
        {
            _places = new ObservableCollection<Place>(DbContextProvider.Context.Place);
        }

        private void ClearEntries()
        {
            Reserves.Clear();
            SelectedPlace = Places.FirstOrDefault();
        }
    }
}
