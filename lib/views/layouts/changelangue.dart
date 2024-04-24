// ignore_for_file: unused_local_variable

import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LocalController extends  GetxController{
  ThemeData apptheme = themeFrancais;
  Locale? language ;
  Myservices myServices = Get.find();
  changeLang(String langcode){
   Locale locale = Locale(langcode);
   myServices.sharedPreferences.setString("lang", langcode);
   apptheme = langcode == "ar" ? themeArabia :themeFrancais;
   Get.changeTheme(apptheme);
   Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? sharedPreflang = myServices.sharedPreferences.getString("lang");
    if(sharedPreflang == "ar"){
      language = const Locale("ar");
      apptheme = themeArabia;
    }else if(sharedPreflang == "fr"){
      language = const Locale("fr");
      apptheme = themeFrancais;
    }else{
       language = const Locale("fr");
      apptheme = themeFrancais;
    }
    super.onInit();
  }
}