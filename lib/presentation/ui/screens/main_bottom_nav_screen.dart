import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  List<Widget>_screens =[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),


  ];

  int _selectedIndex =0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex=index;
          if(mounted){
            setState(() {

            });
          }
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        // showSelectedLabels: true,
        elevation: 4,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categories'),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Wishlist'),



        ],
      ),
    );
  }
}
