import 'package:dailypay/utils/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{

  ThemeProvider(){
    curTheme();
  }

  ThemeData? theme;

  curTheme()async{
    final pref = await SharedPreferences.getInstance();
    String? t = pref.getString('theme');
    if (t != null && t == 'dark') {
      theme = darkTheme;
    } else {
      theme=lightTheme;
    }

    notifyListeners();
  }
  

  void changeTheme(ThemeData myTheme, bool dark)async{
    final pref = await SharedPreferences.getInstance();
    if (dark) {
      pref.setString('theme', 'dark');
    } else {
      pref.setString('theme', 'light');
    }

    print('object');

    theme = myTheme;

    notifyListeners();
  }



}