import 'package:ecommerce/presentation/state_holders/home_slider_controller.dart';
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


  /*Home Slider er api ta amra ekane call koracci (MainBOttomNavScreen)
  karon amader ei screen ta ekbar oi call hocce jokon app ta run hoi
  but , jodi home screen e run korai , tobe dekha jabhe jotho bar e
  home screen e jaccci totho bar oi run hobe

  => jehoto homescreen e besi bar jabho but MainBottomNavScreen e ekbar e jabho
  tai api ta ekane call kora hocce;




  => basically amra oi api er controller ke call korchi;
  */

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
    });
    super.initState();
  }

  /* ===>above code brief

Widgetbinding holo ekta class jetha shokol widget ke maintain kore
addPostFrameCallBack -- jokon all widgets arrage hoi jai, tokon kiso specific
task koro ,
(_){} emon ekta kaaj kore dewa , jekane fuction argument hisabe jetha use
hoi sheta function body er kaaj e dorkar nai

  Get.find<HomeSliderController>().getHomeSlider(); specfic kaaj ta holo
  HomeSliderController ke kujhe er get HomeSlider() function ke call
  korai daw
*/









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
