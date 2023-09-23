import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';
import 'custon_stepper.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
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
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1303978937/photo/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-sneakers-lifestyle.webp?b=1&s=612x612&w=0&k=20&c=cNLaucibZy5Vq4r7dOCt9CNam6lejW3Zxw0Vho_z0mo='))),
          ),
          SizedBox(
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
                          const Text(
                            'Bata New Shoe a#sdfsdf',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  children: [
                                TextSpan(text: 'Color : Black '),
                                TextSpan(text: 'Size : XL'),
                              ]))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.delete_outline))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$1000',
                      style: TextStyle(
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
                            value: 1,
                            onChange: (newvalue) {}),
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
