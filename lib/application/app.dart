import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/application/state_holder_binder.dart';
import 'package:ecommerce/presentation/state_holders/theme_mode_controller.dart';
import 'package:ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



//globally object nicci eta sobai use korte parbe   crafty bay er bitor jara ase


final ThemeModeController themeModeController =ThemeModeController();

class CraftBay extends StatefulWidget {

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const CraftBay({super.key});

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {


  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    // TODO: implement initState
    checkInitialInternetConnection();
    checkInternetConncectivityStatus();
    super.initState();
  }




  void checkInitialInternetConnection()async{
      final result = await Connectivity().checkConnectivity();
      handleConnectivityStatus(result);

  }

  void checkInternetConncectivityStatus() {
    _connectivityStatusStream =
        Connectivity().onConnectivityChanged.listen((status) {
          handleConnectivityStatus(status);
    });
  }


  void handleConnectivityStatus(ConnectivityResult status){
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No internet',
        message: 'Please check your internet connectivity',
        isDismissible: false,
      ));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeModeController.themeNotifier,
        builder:(context,themeMode, _)
       {
        return GetMaterialApp(
          navigatorKey: CraftBay.globalKey,
          debugShowCheckedModeBanner: false,
          home: const Splash_Screen(),
          initialBinding: StateHolderBinder(),
          theme: ThemeData(
              primarySwatch: MaterialColor(
                  ColorPalette.primaryColor.value, ColorPalette().color),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white, // Customize app bar color
              ),

              // for every elevated button same design

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle:  const TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),

              //for every textformfield design this design is same

              inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                disabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              )
          ),




          //themedata use kore amra oisokol widget er color change korte parbo
          //jader color ami manually set kori nai


          darkTheme: ThemeData(
            brightness: Brightness.dark,//by default eta light takhe
              primarySwatch: MaterialColor(
                  ColorPalette.primaryColor.value, ColorPalette().color),


              // for every elevated button same design

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle:  const TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),

              //for every textformfield design this design is same

              inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              )
          ),
          themeMode: themeMode,//eikhane jetha takbe oitar birthite theme ta takbe
        );
      }
    );
  }


  //we should dispose every stream
  @override
  void dispose() {
    // TODO: implement dispose
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}
