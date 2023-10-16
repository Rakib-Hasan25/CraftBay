import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product_data.dart';
import '../../utlis/color_palette.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> imageList;
  ProductImageSlider({super.key, required this.imageList});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  @override
  ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            children: [
              const SizedBox(
                width: 130,
              ),
              ValueListenableBuilder(
                  valueListenable: _selectedSlider,
                  builder: (context, value, _) {
                    List<Widget> list = [];
                    for (int i = 0; i < widget.imageList.length; i++) {
                      list.add(Container(
                        width: 15,
                        height: 15,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color: (value == i)
                                ? ColorPalette.primaryColor
                                : Colors.white),
                      ));
                    }
                    return Row(
                      children: list,
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
