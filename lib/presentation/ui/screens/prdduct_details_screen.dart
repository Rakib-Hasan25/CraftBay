import 'package:ecommerce/presentation/ui/widgets/custon_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';
import '../widgets/SizePicker.dart';
import '../widgets/color_picker.dart';
import '../widgets/product_details_addtocart_container.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blueGrey,
    Colors.black,
    Colors.lightBlue
  ];

  List<String> sizes = ['S', 'L', 'M', 'XL', 'XXL'];

  int _selectedIColorndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const ProductImageSlider(),
                        productDetailsAppBar,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                "Addidas Show Mk345 - Black Edition",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5),
                              )),
                              CustomStepper(
                                  lowerLimit: 1,
                                  upperLimit: 10,
                                  stepValue: 1,
                                  value: 1,
                                  onChange: (newValue) {})
                            ],
                          ),
                          Row(
                            children: [
                              const Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey,
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Review',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorPalette.primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Card(
                                color: ColorPalette.primaryColor,
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),







   // color choose pallete


                          const Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 25,
                            child: ColorPicker(
                              initialSelected: 0,
                              onSelected: (int selectedColor){
                                _selectedIColorndex= selectedColor;
                              },
                              colors: colors,
                            )
                          ),

                          const SizedBox(height: 16),



   //Size choose pallete


                          const Text(
                            "Size",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 25,
                            child: SizePicker(
                              initialSelected: 0,
                              onSelected: (int SelectedSize){
                                _selectedSizeIndex = SelectedSize;

                              },
                              sizes: sizes,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 150,when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop pub,software like Aldus PageMaker including versions of Lorem Ipsum.
                            ''',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            product_details_addtocart_container()
          ],
        ),
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
                        leading: const BackButton(
                          color: Colors.black54,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: const Text(
                          "Product Details",
                          style: TextStyle(color: Colors.black54),
                        ),
                      );
  }
}










