import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Informations1Controller extends GetxController {
  void goToSuivant();
  creerCompte();
}

class Informations1ControllerImp extends Informations1Controller {
  final TextEditingController typeAnController =TextEditingController();
  final TextEditingController descrController =TextEditingController();
  late List<Biens_immobiliers> data1 = [];

  final Myservices myServices = Get.find();
  final AuthService authService = AuthService();

  late String? data3;
  final GlobalKey<FormState> formkeyS = GlobalKey<FormState>();
  late int iduser;
  late List<Biens_immobiliers> data2 = [];
  String selectedNbBien = 'صالة';

  String selectedNbBien1 = 'غرفة';
  String selectedCategory = '';
  @override
  void onInit() {
    iduser = myServices.sharedPreferences.getInt("iduser") ?? 0;
    super.onInit();
  }
  @override
  void dispose() {
    typeAnController.dispose();
    descrController.dispose();
    super.dispose();
  }

  @override
  void goToSuivant() {

    if (selectedNbBien == 'صالة' || selectedNbBien1 == 'غرفة') {
      Get.toNamed(AppRoutes.publicite2, arguments: {
        'typeAn': typeAnController.text,
        'descr': descrController.text,
        'categor': selectedCategory,
        'nbB': '0',
        'nbS': '0'
      });
    } else {
      Get.toNamed(AppRoutes.publicite2, arguments: {
        'typeAn': typeAnController.text,
        'descr': descrController.text,
        'categor': selectedCategory,
        'nbB': selectedNbBien,
        'nbS': selectedNbBien1
      });
    }
      
    typeAnController.text ='';
    descrController.text ='';
    selectedCategory ='';
    selectedNbBien ='صالة';
    selectedNbBien1='غرفة';
  }

  @override
  void creerCompte() {
    Get.toNamed(AppRoutes.register);
  }

}