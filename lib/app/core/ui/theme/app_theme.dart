import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        primarySwatch: _ciphertheme,
      );

  static const MaterialColor _ciphertheme = MaterialColor(_cipherthemePrimaryValue, <int, Color>{
    50: Color(0xFFE1E7FD),
    100: Color(0xFFB4C2FB),
    200: Color(0xFF8299F9),
    300: Color(0xFF5070F6),
    400: Color(0xFF2B52F4),
    500: Color(_cipherthemePrimaryValue),
    600: Color(0xFF042EF0),
    700: Color(0xFF0427EE),
    800: Color(0xFF0320EC),
    900: Color(0xFF0114E8),
  });
  static const int _cipherthemePrimaryValue = 0xFF0533F2;
}
