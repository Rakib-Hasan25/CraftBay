import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/CartListcontroller.dart';
import '../widgets/Cart_Product_Card.dart';
import '../widgets/product_details_addtocart_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override


  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_)
    {
      Get.find<CartListController>().getCartList();
    });


    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Carts',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
      ),
      body: GetBuilder<CartListController>(
        builder: (controller) {

          if(controller.addToCartInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }


          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartListModel.data!.length??0,
                  itemBuilder: (context, index) {
                    return CartProductCard(cartData:controller.cartListModel.data![index]);
                  },
                ),
              ),
              // product_details_addtocart_container(),
            ],
          );
        }
      ),
    );
  }
}
