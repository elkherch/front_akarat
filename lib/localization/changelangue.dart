// ignore_for_file: unused_local_variable

import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LocalController extends GetxController {
  bool selectLangue = false;
  ThemeData apptheme = themeFrancais;
  Locale? language;
  Myservices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    selectLangue = langcode == "fr";
    apptheme = langcode == "ar" ? themeArabia : themeFrancais;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreflang = myServices.sharedPreferences.getString("lang");
    if (sharedPreflang == "ar") {
      selectLangue = false;
      language = const Locale("ar");
      apptheme = themeArabia;
    } else if (sharedPreflang == "fr") {
      selectLangue = true;
      language = const Locale("fr");
      apptheme = themeFrancais;
    } else {
      selectLangue = true;
      language = const Locale("fr");
      apptheme = themeFrancais;
    }
    super.onInit();
  }
}
