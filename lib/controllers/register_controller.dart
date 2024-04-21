import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
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

  late String selectedAccountTypeI;
  Map<String, dynamic>? data;
  GlobalKey<FormState> formkeyR = GlobalKey<FormState>();

  @override
  signUp() async {
    var formdata = formkeyR.currentState;
    if (formdata!.validate()) {
      data = await authService.signUp(Apilink.user_register, {
        "username": nomuser.text,
        "first_name": prenomuser.text,
        "email": emailuser.text,
        "password": passworduser.text,
        "type_compte": selectedAccountTypeI.toString(),
        "numero_tel": numeroteluser.text,
        "facebook": fbuser.text,
      });
      print(data);
      goTologin();
      // Vérifier d'abord si data est null
      // if (data != null) {
      //   // Vérifier si data['status'] est vrai et rediriger vers la page de connexion
      //   if (data!['success']) {
      //   }
      // }

      update();
    } else {
      print("object");
    }
    print("1");
  }

  @override
  goTologin() {
    Get.toNamed(AppRoutes.login);
  }

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
  void dispose() {
    emailuser.dispose();
    passworduser.dispose();
    nomuser.dispose();
    prenomuser.dispose();
    numeroteluser.dispose();
    fbuser.dispose();

    super.dispose();
  }
}
