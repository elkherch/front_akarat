// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData  themeFrancais = ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor
          ),
          headline3: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.black
          ),
           headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor
          ),
          headline5: TextStyle(
            fontSize: 28,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.black
          ),
          
          bodyText1: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
        ),
        primaryColor: Colors.blue
      );
ThemeData  themeArabia = ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor
          ),
          headline3: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.black
          ),
           headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor
          ),
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.black
          ),
          
          bodyText1: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
        ),
        primaryColor: Colors.blue
      );