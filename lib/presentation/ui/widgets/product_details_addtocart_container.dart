

import 'package:ecommerce/data/model/product_details_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/add_to_cart_controller.dart';
import '../utlis/color_palette.dart';
class product_details_addtocart_container extends StatelessWidget {

  final ProductDetailsData productDetailsData;
  final String color;
  final String size;

  const product_details_addtocart_container({
    super.key,
    required this.productDetailsData,
    required this.color,
    required this.size
  });
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54
              ),),
              const SizedBox(height: 4,),
              Text('\$${2000}',style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorPalette.primaryColor
              )),
            ],
          ),
          SizedBox(
              width: 120,
              child: GetBuilder<AddToCartController>(
                builder: (controller) {
                  if(controller.addToCartInProgress){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }


                  return ElevatedButton(onPressed: ()async{



                    final result = await controller.addToCart(
                            productDetailsData.id!,
                      color,
                      size,
                      1
                    );
                  },
                      child:const Text('Add to cart'));
                }
              )),
        ],

      ),
    );
  }
}