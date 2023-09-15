import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utlis/color_palette.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  ValueNotifier<int>_selectedSlider= ValueNotifier(0);
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,autoPlay: true,autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (int page, _){
                _selectedSlider.value = page;

              }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),

        const SizedBox(
          height: 16,
        ),



        Row(
          children: [
            const SizedBox(width: 130,),
            ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context,value,_){
              List<Widget>list =[];
              for(int i=0;i<5;i++){
                list.add( Container(
                  width: 15,
                  height: 15,
                  margin:const EdgeInsets.symmetric(horizontal: 5.0)
                  ,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: (value == i)? ColorPalette.primaryColor:null
                  ),
                ));
              }
              return Row(
                children: list,
              );

            }),
          ],
        ),

      ],
    );
  }
}
