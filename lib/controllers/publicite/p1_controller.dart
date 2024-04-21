import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Informations1Controller extends GetxController {
  void goToSuivant();
}

class Informations1ControllerImp extends Informations1Controller {
  late TextEditingController type_an;
  late TextEditingController descr;
  late List<Biens_immobiliers> data1 = [];

  final Myservices myServices = Get.find();
  final AuthService authService = AuthService();

  late RxString selectedAccountE;
  late String? data3;
  final GlobalKey<FormState> formkeyS = GlobalKey<FormState>();
  late int iduser;
  late List<Biens_immobiliers> data2 = [];
  String? nbBien;
  String? nbBien1;
  final RxList<String> dropdownValues = [
    '24', '33', '34', '35', '49', '50', '51', '52', '53', '54',
    '55', '56', '57', '58', '59', '60', '61', '62', '63', '64',
    '65', '66', '67',
  ].obs;
  final RxList<String> dropdownLabels = [
    '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ].obs;
  final RxList<String> dropdownValuesNumber = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
  ].obs;

  final RxList<String> dropdownLabelsNumber = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
  ].obs;

  final RxList<String> dropdownValuesNumberI = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
  ].obs;

  final RxList<String> dropdownLabelsNumberI = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
  ].obs;

  @override
  void onInit() {
    selectedAccountE = '24'.obs;
    nbBien = '1';
    nbBien1 = '1';
    iduser = myServices.sharedPreferences.getInt("iduser") ?? 0;
    descr = TextEditingController();
    type_an = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    type_an.dispose();
    descr.dispose();
    super.dispose();
  }

  @override
  void goToSuivant() {
    var formdata = formkeyS.currentState;
    if (formdata != null && formdata.validate()) {
      update();
      String selectedValue = selectedAccountE.value;
      int index = dropdownValues.indexOf(selectedValue);
      String selectedLabel = dropdownLabels[index];
      String? selectedNb = nbBien;
      String? selectedNb2 = nbBien1;
      int val = dropdownValuesNumber.indexOf(selectedNb);
      String valSelected = dropdownLabelsNumber[val];
      int valI = dropdownValuesNumberI.indexOf(selectedNb2);
      String valSelectedI = dropdownLabelsNumberI[valI];
      Get.toNamed(AppRoutes.publicite2, arguments: {
        'typeAn': type_an.text,
        'descr': descr.text,
        'categor': selectedLabel,
        'nbB': valSelected,
        'nbS': valSelectedI
      });
      print(valSelected);
      print(valSelectedI);
      print(selectedLabel);
    }
  }

  @override
  void creerCompte() {
    Get.toNamed(AppRoutes.register);
  }
}
