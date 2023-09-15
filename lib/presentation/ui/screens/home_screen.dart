import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/utlis/image_assets.dart';
import 'package:flutter/material.dart';

import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,


        title: Row(
          children: [
            Image.asset(ImageAssets.craftyBayNavLogoPNG,fit: BoxFit.cover,),

            const Spacer(),

            CircularIconButton(icon: Icons.person,onTap: (){},),
            SizedBox(width: 10,),
            CircularIconButton(icon: Icons.call,onTap: (){},),
            SizedBox(width: 10,),
            CircularIconButton(icon: Icons.notification_important,onTap: (){},),


          ],
        )
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText:"Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )
                ),
              ),

            ),


      const SizedBox(height: 16,),

            HomeSlider(),





          ],
        ),
      ),

    );
  }
}




