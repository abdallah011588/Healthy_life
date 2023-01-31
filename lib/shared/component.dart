import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme=ThemeData(

  //scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    //titleSpacing: 20.0,
    backgroundColor: HexColor('45BE22'),
    elevation: 0.0,
    // titleTextStyle: TextStyle(
    //    // color: Colors.white,
    //     fontSize: 20.0,
    //     fontWeight: FontWeight.bold
    // ),
   // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('45BE22'),
      statusBarIconBrightness: Brightness.light,
    ),
    // iconTheme: IconThemeData(
    //   color: Colors.black,
    // ),
  ),

);