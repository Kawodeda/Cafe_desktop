   M S B A M L   `   `   `  ����G  CCafe_Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:Cafe_Desktop.ViewModelsCafe_Desktop.ViewModels  5   	   #    Cafe_Desktop.Views.CookWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4vm%clr-namespace:Cafe_Desktop.ViewModels     5   	   -   5        $��
ThisWindow��5   	     � Title$  Окно повара��5   	   $	��450��5	   	   $	��800��5
   	   $	��400��5   	   $	��600��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Icon$ /Resources/icon.ico��5   	    � DataContext 5      $   Cafe_Desktop.ViewModels.CookVM  5   
    � 	Resources 5         OrderTemplate � ColumnDefinitions � RowDefinitions �� StringFormat �� ConverterCulture*  $System.Windows.Controls.DataGridCell	 �� 
TargetType  ColumnCenteredStyle
 �� Property �� Value��%+  &	        &	 �    �� 5   
   .R�5      �  5      �� 5      �� 5      �� 5       5      �� 5      �� 5      .+�5      �� $��30��5!      $��0, -10, 0, 0q�5"      $��0��5#      $��0��5$      ��5       �� *	Created+$ {0:t}��$ ru-ru��5$      �� 5%      $��10, -10, 0, 0q�5'      $��30��5(      $��1��5)      $��0��5*      ��5&      �� *OrderStatus.Title+$	 {0}��5*      5+      5,      �� 5-   
   "	  6   .�5/      �� 
 � ��$ Center=�6;   50      51      .��52      �  53   
   �� 54      $��108.503 �6   �� 55      $��11.497 �6   �� 56      $
��130* �6   �� 57      $
��367* �6   �� 58      $
��auto �6    5:   
   �� 5;      $
��auto �6   �� 5<      $��* �6   .+�5>   
   �� $��/Resources/logo.png��5?      $
��Left=�5@      $��Center=�5A      $	��120��5B      $��2��6   �� 5C   
   $��10,0,0,0q�5E      $��2��5F      $��3��5G      $��Center=�5H      ��5D      �� *PersonalAreaVM.UserWelcome+5H      &   System.Windows.Controls.DataGrid  5I   
   $��0��5J      $��1��5K      $��4��5L      $��10, 0, 10, 10q�5M        EntryBackground   RowBackground# [ 5P         HeadersVisibility$
 None=�5Q        MainFont#��[ 5R      $��20(�5S         RowDetailsVisibilityMode$ VisibleWhenSelected=�5T         VerticalGridLinesBrush
 ����    HorizontalGridLinesBrush
 ���� ��5N      �� *RetrieveOrdersVM.Orders+ �� SelectedItem 5O      �� *UpdateOrderVM.SelectedOrder+   Columns 5W      0  *System.Windows.Controls.DataGridTextColumn  5X      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6q   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *	Created+$ {0:t}��$ ru-ru��6q     5Y      $ * 6a    6%   �� *OrderStatus.Title+$	 {0}��6a      	CellStyle 5[      �� 5\      "	  6   .�5]      �� 
 � ��$ Center=�6C    �� 	Resources 5^      ��%^   '��       �� 5_      "	 ��6    .�5`      �� 
 �@��CornerRadius$ 5��6=   5a      5b      5c         RowStyle 5e      �� 5f      )  #System.Windows.Controls.DataGridRow"	  6    5g      ��%^   '��       �� 5h      "	 ��6    .�5i      �� 
 �@��CornerRadius$ 5��6=   5j      5k      5l         RowDetailsTemplate 5n      �� 5o      .R�5p      �� ��5q      �� *	Reserve+��5r      �� 5s      .R�5t   "   �� ��5u   %   �� *
Dish.Title+5v      5x      5y      5{      �� 5|   
     BorderBrush#��[ 5}      $��2q�5~       �� CornerRadius$ 5��5      $��4��5�      $��1��5�      $	��Top=�5�      $��0, 0, 10, 0q�5�      ._�5�      � .+�5�      �� $#��Изменить статус��5�      $��5, -23, 10, 0q�5�      $	��Top=�5�      $
��Left=�5�      
�������5�      �� 5�      $��10, 10, 0, 10q�5�       �� Orientation$ Vertical=�5�      .+�5�      	� -   5        $��CookingRbtn��5�      $��готовится��5�       	� 	GroupName$ Status��5�      $��5, -13, 0, 0q�5�       d� 	IsChecked 5�      �� *)'UpdateOrderVM.SelectedOrderVM.IsCooking+{�5�      �� *%#UpdateOrderVM.StatusChangingEnabled+
 � Tag 5�      .	   (Cafe_Desktop.ViewModels.UpdateStatusInfo	  5�       	  OrderStatusId$ 2��5�   !   5�      	� 5�      -   5        $��
CookedRbtn��5�      $��
готов��5�      $ Status��5�      $��
0, 5, 0, 0q�5�      $��5, -13, 0, 0q�5�       5�      �� *(&UpdateOrderVM.SelectedOrderVM.IsCooked+{�5�      �� *%#UpdateOrderVM.StatusChangingEnabled+ 5�      	  5�      $ 3��5�   !   5�      �� 5�      $��Изменить��5�      $	��120��5�      $��0, 10, 10, 0q�5�      ��5�      �� *" UpdateOrderVM.UpdateOrderCommand+��5�      `� 5�        UpdateStatusConverter `� 	Converter# [ 6+   .1�5�   "   ��   �� ElementName$  CookingRbtn��6*   �� 5�   "   $  
CookedRbtn��6*   5�      5�      5�      5�      5�      �� 5�   
     ExitButtonStyle#��[ 5�      $��
Назад��5�      $��1��5�      $��4��5�      $��Center=�5�      $��Bottom=�5�      $��0, 0, 0, 15q�5�      $	��120��5�      ��5�      �� *BackCommand+��5�      �� $  
ThisWindow��5�      5�      5�      