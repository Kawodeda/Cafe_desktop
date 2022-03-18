
namespace Cafe_Desktop.ViewModels
{
    public class RetrieveUpdateOrdersVM : Notifier
    {
        protected UserPersonalAreaVM _personalAreaVM;
        protected RetrieveOrdersVM _retrieveOrdersVM;
        protected UpdateOrderVM _updateOrderVM;
        protected RelayCommand _backCommand;

        public RetrieveUpdateOrdersVM()
        {
            _retrieveOrdersVM = new RetrieveOrdersVM();
            _updateOrderVM = new UpdateOrderVM();
            _personalAreaVM = new UserPersonalAreaVM();
        }

        public UserPersonalAreaVM PersonalAreaVM
        {
            get => _personalAreaVM;
        }

        public RetrieveOrdersVM RetrieveOrdersVM
        {
            get => _retrieveOrdersVM;
        }

        public UpdateOrderVM UpdateOrderVM
        {
            get => _updateOrderVM;
        }

        public RelayCommand BackCommand
        {
            get
            {
                return _backCommand ?? (_backCommand = new BackToLoginCommand());
            }
        }
    }
}
