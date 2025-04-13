import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    final themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: brightness),
    );
    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(fontFamily: GoogleFonts.sawarabiGothic().fontFamily),
      dividerTheme: const DividerThemeData(thickness: 1.0),
    );
  }
}
