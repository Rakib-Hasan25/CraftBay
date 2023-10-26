import 'package:ecommerce/presentation/state_holders/CartListcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/cart_list_model.dart';
import '../utlis/color_palette.dart';
import 'custon_stepper.dart';

class CartProductCard extends StatelessWidget {
  final CartData cartData;
    const CartProductCard({
    super.key,
    required this.cartData
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                       cartData.product?.image ?? ""))),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            cartData.product?.title ?? '',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  children: [
                                TextSpan(text: 'Color : ${cartData.color ?? ''} '),
                                 TextSpan(text: 'Size : ${cartData.size ?? ''}'),
                              ]))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.find<CartListController>().removeFromCart(cartData.productId!);
                        }, icon: Icon(Icons.delete_outline))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cartData.product?.price ?? ''}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.primaryColor),
                    ),
                    SizedBox(
                      width: 80,
                      child: FittedBox(
                        child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue: 1,
                            value: cartData.numberofItem ?? 1,
                            onChange: (int value) {
                              // print(value);
                              Get.find<CartListController>().addItem(cartData.id!,value );

                            }),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
