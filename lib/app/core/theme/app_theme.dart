import 'dart:ui';

import 'package:flutter/material.dart' show AppBarTheme, ColorScheme, Colors, TextTheme, ThemeData;
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme2 = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.black));

  static final lightTheme =
      ThemeData.light().copyWith(
          backgroundColor: Colors.green,
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(brightness: Brightness.light,
         ));

  static final darkTheme =ThemeData(

      fontFamily: 'Bookman Old Style',


      useMaterial3: true,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 1000,
        backgroundColor: Colors.white,
      )
  );
}
