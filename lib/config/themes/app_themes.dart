import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0xFFec1d24),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xFFec1d24),
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: BeveledRectangleBorder(),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFec1d24),
        ),
      ),
      textTheme: GoogleFonts.montserratTextTheme(),
    );
  }
}
