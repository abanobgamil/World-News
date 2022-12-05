import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor("#373636"),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor("#373636"),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: HexColor("#373636"),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor("#373636"),
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: Colors.white,
    ),
    headline2:  TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      letterSpacing: 2,
    ),
  ),
);




ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.black
  ),
  textTheme: const TextTheme(
    bodyText1:  TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: Colors.black,
    ),
    headline2:  TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w900,
      color: Colors.black,
      letterSpacing: 2,
    ),

  ),
);