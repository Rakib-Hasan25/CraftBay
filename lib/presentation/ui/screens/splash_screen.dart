import 'package:ecommerce/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utlis/image_assets.dart';
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNextScreen();

  }
  void goToNextScreen(){
    Future.delayed(const Duration(seconds: 3)).then((value) {
     Get.offAll(const MainBottomNavScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: Image.asset(ImageAssets.craftyBayLogoPNG,)),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 16,),

          const Text('version 1.0.0'),
          const SizedBox(height: 16,),

        ],
      )

    );
  }
}
