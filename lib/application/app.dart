import 'package:ecommerce/application/state_holder_binder.dart';
import 'package:ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftBay extends StatefulWidget {

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();


  const CraftBay({super.key});

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftBay.globalKey,
      debugShowCheckedModeBanner: false,
      home: const Splash_Screen(),
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        primarySwatch: MaterialColor(
            ColorPalette.primaryColor.value, ColorPalette().color),

      // for every elevated button same design



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            textStyle: TextStyle(
                fontSize: 14,
                letterSpacing:0.5,
                fontWeight: FontWeight.w600
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            )

        )
      ),


      //for every textformfield design this design is same

        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        )

      ),
    );
  }
}


