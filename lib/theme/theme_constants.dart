import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(),
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(10))
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)
  ),
  primaryColor: Colors.black87,
  iconTheme: IconThemeData(color: Colors.black87),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black87, selectionColor: Colors.grey[400], selectionHandleColor: Colors.black87)
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black87,
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5), borderRadius: BorderRadius.circular(10))
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.white)
  ),
  primaryColor: Colors.white70,
  iconTheme: IconThemeData(color: Colors.white70),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white70, selectionColor: Colors.grey[200]!.withOpacity(0.2), selectionHandleColor: Colors.white70)
);