import 'package:ecommerce/presentation/ui/screens/prdduct_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utlis/color_palette.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to(ProductDetailsScreen());
      },
      child: Card(
        shadowColor: ColorPalette.primaryColor.withOpacity(0.1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: ColorPalette.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),



                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/shoe.png'
                          )
                      )),


                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Nike shoe Ak3635',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$90',style: TextStyle(
                            fontSize: 13,
                            color: ColorPalette.primaryColor,
                            fontWeight: FontWeight.w500
                        ),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text('4.8',style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                                fontSize: 13,
                                overflow: TextOverflow.ellipsis) ,),
                          ],
                        ),
                        Card(
                          color: ColorPalette.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
