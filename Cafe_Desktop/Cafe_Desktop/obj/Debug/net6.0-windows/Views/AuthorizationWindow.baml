   M S B A M L   `   `   `  ����G  CCafe_Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:Cafe_Desktop.ViewModelsCafe_Desktop.ViewModels  5   	   ,    &Cafe_Desktop.Views.AuthorizationWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4vm%clr-namespace:Cafe_Desktop.ViewModels     5   	   -   5        $��
ThisWindow��5   	     � Title$  Авторизация��5   	   $	��480��5	   	   $	��750��5
   	   $	��460��5   	   $	��550��5   	    � Icon$ /Resources/icon.ico��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � DataContext 5      -   'Cafe_Desktop.ViewModels.AuthorizationVM  5   
   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      .+�5   
   �� $��/Resources/logo.png��5      $��0��5      $	��Top=�5      $��Center=�5      $��
0, 0, 0, 0q�5      $	��150��5      $	��180��5      �� 5    
   $/��)Введите логин и пароль��5!      $��Center=�5"      $	��Top=�5#      $��1��5$      �� 5%   
   $��1��5&       �� Orientation$ Vertical=�5'      $��Center=�5(      $��Center=�5)      $��0, 0, 80, 60q�5*      .+�5+      �� $ 
Horizontal=�5,      $��Right=�5-      .+�5.      ]� .+�5/      �� $��Логин:��50      $��0, 0, 30, 0q�51      $
��Left=�52      �� 53      -   5        $��LoginTextBox��54      $��
0, 0, 0, 0q�55      $��Right=�56      ��57      �� *
Username+.��63   58      59      5:      �� 5;      $ 
Horizontal=�5<      .+�5=      ]� .+�5>      �� $��Пароль:��5?      $��0, 0, 30, 0q�5@      $
��Left=�5A      G� 5B      -   5        $��MainPasswordBox��5C      $��
0, 0, 0, 0q�5D      $��Right=�5E      5F      5G      �� 5H      $��
Войти��5I       �� 	IsDefault$
 True��5K      $	��180��5L      $��90, 10, 0, 0q�5M      ��5J      �� *LoginCommand+��5N      `� 5O         LoginParamsConverter `� 	Converter# [  6#   .1�5P      ��  �� ElementName$ MainPasswordBox��6"   �� 5Q      $ 
ThisWindow��6"   5R      5T      5U      �� 5V   
     ExitButtonStyle#��[ 5W      $��
Выход��5X      $��1��5Z      $��Center=�5[      $��Bottom=�5\      $��0, 0, 0, 15q�5]      $	��120��5^      ��5Y      �� *ExitCommand+5^      5_      5`      