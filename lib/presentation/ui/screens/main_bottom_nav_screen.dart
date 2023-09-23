import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/screens/CartScreen.dart';
import 'package:ecommerce/presentation/ui/screens/catagory_list_screen.dart';
import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  final List<Widget> _screens = [
    HomeScreen(),
    CatagoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentSelectedIndex,
          onTap: controller.changeScreen,
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          // showSelectedLabels: true,
          elevation: 4,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
