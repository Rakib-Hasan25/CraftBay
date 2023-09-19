import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/screens/catagory_list_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/utlis/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/catagoryCard.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/ProductCard.dart';
import '../widgets/home/home_section_title.dart';
import '../widgets/home/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                ImageAssets.craftyBayNavLogoPNG,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              CircularIconButton(
                icon: Icons.person,
                onTap: () {},
              ),
              SizedBox(
                width: 10,
              ),
              CircularIconButton(
                icon: Icons.call,
                onTap: () {},
              ),
              SizedBox(
                width: 10,
              ),
              CircularIconButton(
                icon: Icons.notification_important,
                onTap: () {},
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSlider(),
              HomeSectionTitle(
                title: 'Catagories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CatagoryCard();
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'Popular',
                onTap: () {},
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
