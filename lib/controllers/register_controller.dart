import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/layouts/show.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControler extends GetxController {
  signUp();
  goTologin();
}

class SignUpControlerImp extends SignUpControler {
  late TextEditingController emailuser;
  late TextEditingController passworduser;
  late TextEditingController nomuser;
  late TextEditingController prenomuser;
  late TextEditingController numeroteluser;
  late TextEditingController fbuser;

  Myservices myServices = Get.find();
  final AuthService authService = AuthService();
  RxBool isLoading = false.obs;
  late String selectedAccountTypeI;
  Map<String, dynamic>? data;

  @override
  void onInit() {
    emailuser = TextEditingController();
    passworduser = TextEditingController();
    nomuser = TextEditingController();
    prenomuser = TextEditingController();
    fbuser = TextEditingController();

    numeroteluser = TextEditingController();
    selectedAccountTypeI = '92'.tr;
    super.onInit();
  }

  @override
  signUp() async {
    isLoading.value = true;
    try {
       data = await authService.signUp(Apilink.user_register, {
        "username": numeroteluser.text,
        "first_name": prenomuser.text,
        "email": emailuser.text,
        "password": passworduser.text,
        "numero_tel": nomuser.text,
      });
      isLoading.value = false;
      Get.snackbar(
         '189'.tr,
         '188'.tr,
         snackPosition: SnackPosition.TOP,
         duration: const Duration(seconds: 2),
         backgroundColor: Colors.green,
         colorText: Colors.white,
         messageText: Text(
           '189'.tr,
           style: const TextStyle(
             color: Colors.green,
             fontSize: 18.0,
             fontWeight: FontWeight.bold
           ),
         ),
         titleText: Text(
            '188'.tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
         ),
        );
      Get.toNamed(AppRoutes.login);
    } catch (e) {
      isLoading.value = false;
      showDaialog('186'.tr,'185'.tr);
    }
  }

  @override
  goTologin() {
    Get.toNamed(AppRoutes.login);
  }

  
  @override
  void dispose() {
    emailuser.dispose();
    passworduser.dispose();
    nomuser.dispose();
    prenomuser.dispose();
    numeroteluser.dispose();
    fbuser.dispose();

    super.dispose();
  }
  @override
  void onClose() {
    emailuser.dispose();
    passworduser.dispose();
    prenomuser.dispose();
    numeroteluser.dispose();
    nomuser.dispose();
    fbuser.dispose();
    super.onClose();
  }
}
