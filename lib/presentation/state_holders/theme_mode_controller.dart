import 'package:flutter/material.dart';


class ThemeModeController {
  ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
  
  void changeThemeMode(ThemeMode mode){
    themeMode.value=mode;
  }


  void toggleThemeMode(){
    if(themeMode.value == ThemeMode.light){
      themeMode.value = ThemeMode.dark;

    }
    else{
      themeMode.value = ThemeMode.light;
    }
  }



  void saveCurrentThemeMode(){
    //joko  app restart kori tokon amader ager state harai jai
    // mane aghe jodi dark mode e takhe , abar start howar somoi light mode
    // e run hoi mane amader agher state ta harai jai eta ke dore rakte hobe




  }












}


/*   jokon oi value notifier er value change hobe tokonoi
    valueNotifierbuilder er call hobe
   valueNotifier hisabe thememode ke nilam , tai thememode change holei
  valueNotifier builder build korbe eta jei onsho ke wrap kore ache


  ValueListenableBuilder
  (
  valueListenable: jei variable er value change hobe
  child: (jodi kono widget use korte chai punorai build na kore)
  builder:(context,variable , widget(jei widget niye kaaj korte chai)tar name ,eta ke skip o kora ja
  and jekono nam o deya jai(SKIP KORTE _ & use korte jekono nam)
  {
    biore kaaj
  }

  )




 */