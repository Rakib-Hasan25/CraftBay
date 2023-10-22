import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_product_controller.dart';
import 'package:ecommerce/presentation/state_holders/special_product_controller.dart';
import 'package:ecommerce/presentation/ui/screens/catagory_list_screen.dart';
import 'package:ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/utlis/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/catagory_controller.dart';
import '../../state_holders/new_product_controller.dart';
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
              const SizedBox(
                width: 10,
              ),
              CircularIconButton(
                icon: Icons.call,
                onTap: () {},
              ),
              const SizedBox(
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
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),



              GetBuilder<HomeSliderController>(
                 builder: (controller) {

                   if(controller.getHomeSliderInProgress ){
                     return const SizedBox(
                       height: 180,
                       child: Center(
                         child: CircularProgressIndicator(),
                       ),
                     );
                   }
                   return HomeSlider(sliderData:controller.sliderModel.data ?? [],);
                 }
               ),




              HomeSectionTitle(
                title: 'Catagories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(

                  builder: (controller) {
                    if(controller.getCategoryListInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: controller.categoryListModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CatagoryCard(
                              categoryData: controller.categoryListModel.data![index],
                            onTap: (){
                                Get.to(controller.categoryListModel.data![index].id!.toInt());
                            },
                          );
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'Popular',
                onTap: () {
                  // Get.to(ProductListScreen());

                },
              ),
              SizedBox(
                height: 190,
                child: GetBuilder<PopularProductController>(
                  builder: (controller) {
                    if(controller.getPopularProductsInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: controller.PopularProductModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCard(productData: controller.PopularProductModel.data![index] ,);
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 190,
                child: GetBuilder<NewProductController>(
                    builder: (controller) {
                      if(controller.getNewProductsInProgress){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView.builder(
                          itemCount: controller.NewProductModel.data?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductCard(productData: controller.NewProductModel.data![index],);
                          });
                    }
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSectionTitle(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 190,
                child: GetBuilder<SpecialProductController>(
                    builder: (controller) {
                      if(controller.getSpecialProductsInProgress){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: controller.SpecialProductModel.data?.length??0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductCard(productData: controller.SpecialProductModel.data![index],);
                          });
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
