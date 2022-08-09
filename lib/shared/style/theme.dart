import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      /*systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
      ),*/
      backgroundColor: Color(0xFFFAFAFA),
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: Color(0xFF1F948B),
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xFF1F948B),
    unselectedItemColor: Colors.black45,
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 10.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: HexColor('2b2c2c'),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: HexColor('2b2c2c'),
      elevation: 0.0,
      actionsIconTheme: const IconThemeData(
        color: Color(0xFF1F948B),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.black26,
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )),
);