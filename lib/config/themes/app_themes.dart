import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xFFec1d24),
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
      ),
      textTheme: GoogleFonts.montserratAlternatesTextTheme(),
    );
  }
}
