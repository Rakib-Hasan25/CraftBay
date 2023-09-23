import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Cart_Product_Card.dart';
import '../widgets/product_details_addtocart_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return CartProductCard();
              },
            ),
          ),
          product_details_addtocart_container(),
        ],
      ),
    );
  }
}
