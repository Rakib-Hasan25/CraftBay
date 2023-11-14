import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeModeController {

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);
  ThemeModeController(){
    _loadThemeMode();
  }
  Future<void> _loadThemeMode()async{
          final pref =await SharedPreferences.getInstance();
          final savedThemeMode = pref.getString('themeNotifier');
          if (savedThemeMode == 'dark') {
            themeNotifier.value = ThemeMode.dark;
          } else if (savedThemeMode == 'light') {
            themeNotifier.value = ThemeMode.light;
          }
          else{
            themeNotifier.value = ThemeMode.light;// when savedThemeMode is null
          }
  }


Future<void>_saveThemeMode(ThemeMode mode)async{
  final pref =await SharedPreferences.getInstance();
   await pref.setString('themeNotifier', themeModeToString(mode));

}

String themeModeToString(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    case ThemeMode.system:
      return 'system';
  }
}


  Future<void> toggleThemeMode()async{
    if(themeNotifier.value == ThemeMode.light){
      themeNotifier.value = ThemeMode.dark;
     await _saveThemeMode( ThemeMode.dark);
    }
    else{
      themeNotifier.value = ThemeMode.light;
      await _saveThemeMode( ThemeMode.light);
    }
  }
}