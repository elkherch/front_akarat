import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Informations1ControllerAdmin extends GetxController {
  void goToSuivant(String selectedCategory, String selectedChambe, String selectedSalon);
  creerCompte();
}
class Informations1ControllerAdminImp extends Informations1ControllerAdmin {
  late TextEditingController typeAnController =TextEditingController();
  late TextEditingController descrController =TextEditingController();
  late List<Biens_immobiliers> data1 = [];

  final Myservices myServices = Get.find();
  final AuthService authService = AuthService();

  late String? data3;
  final GlobalKey<FormState> formkeyS = GlobalKey<FormState>();
  late int iduser;
  late List<Biens_immobiliers> data2 = [];
 
  @override
  void onInit() {
    typeAnController = TextEditingController();
    descrController = TextEditingController();
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
  void goToSuivant(String selectedCategory, String selectedChambe, String selectedSalon) {
     print(selectedCategory);
     print(selectedChambe);
     print(selectedSalon);
    if (selectedChambe == 'صالة' || selectedSalon == 'غرفة' || selectedChambe == 'Salon' || selectedSalon == 'Chambre') {
      
      Get.toNamed(AppRoutes.publicite2Admin, arguments: {
        'typeAn': typeAnController.text,
        'descr': descrController.text,
        'categor': selectedCategory,
        'nbB': '0',
        'nbS': '0'
      });
      typeAnController = TextEditingController();
      descrController = TextEditingController();
    } else {
      Get.toNamed(AppRoutes.publicite2Admin, arguments: {
        'typeAn': typeAnController.text,
        'descr': descrController.text,
        'categor': selectedCategory,
        'nbB': selectedChambe,
        'nbS': selectedSalon
      });
      
      typeAnController = TextEditingController();
      descrController = TextEditingController();
    }
  }

  @override
  void creerCompte() {
    Get.toNamed(AppRoutes.register);
  }

}