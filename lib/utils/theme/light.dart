import 'package:dailypay/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      primarySwatch: dailiPayColor,
      scaffoldBackgroundColor: Colors.white,

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(color: Colors.black),
        bodyMedium: GoogleFonts.poppins(color: Colors.black),
        bodySmall: GoogleFonts.poppins(color: Colors.black),
        titleLarge: GoogleFonts.poppins(color: Colors.black),
        titleMedium: GoogleFonts.poppins(color: Colors.black),
        titleSmall: GoogleFonts.poppins(color: Colors.black),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        )
      ),

      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.tealAccent,
        textTheme: ButtonTextTheme.primary,
      ),
    );