

import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';
class product_details_addtocart_container extends StatelessWidget {
  const product_details_addtocart_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54
              ),),
              SizedBox(height: 4,),
              Text('\$1000',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorPalette.primaryColor
              )),
            ],
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(onPressed: (){}, child:const Text('Add to cart'))),
        ],

      ),
    );
  }
}