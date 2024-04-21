// ignore_for_file: avoid_print

import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Informations2Controller extends GetxController {
  goToPublicite();
  goToPublicite1();
  creerCompte();
}
class Informations2ControllerImp extends Informations2Controller {
  late String region;
  late String emplacement;
  late TextEditingController adresse;
  late TextEditingController surface;
  late TextEditingController prix;
  late TextEditingController mr;

  Myservices myServices = Get.find();
  final AuthService authService = AuthService();
  late List<Biens_immobiliers> data = [];

  late String selectDevise;
  late String selectUnite;
  int? iduser;
  @override
  goToPublicite() async {
    try {
      String typeAnnonce = Get.arguments['typeAn'].toString();
      String description = Get.arguments['descr'].toString();
      String categor = Get.arguments['categor'].toString();
      String nbBien = Get.arguments['nbB'].toString();
      String nbSalon = Get.arguments['nbS'].toString();

      if (iduser !=0) {
        String surfaceWithUnit = '${surface.text} $selectUnite';
        String prixWithDevice = '${prix.text} $selectDevise';

        print(typeAnnonce);
        print(description);
        print(categor);
        Get.toNamed(AppRoutes.publicite3, arguments: {
    "type_de_bien": typeAnnonce,
    "prix": prixWithDevice,
    "surface": surfaceWithUnit,
    "description": description,
    "categorie": categor,
    "region": region,
    "emplacement": emplacement,
    "adresse": adresse.text,    
    "nombre_bains": nbBien,    
    "nombre_sals": nbSalon,    

    },
    
  );
      print(nbSalon);
      print(nbBien);
      update();
      }else{
            print('User not exite....');
      }
    } catch (e) {
       print('Error fetching data: $e');
    }
    

  }

  @override
  goToPublicite1() {
    Get.toNamed(AppRoutes.publicite);
  }

  @override
  void onInit() {
    region = '27'.tr;
    emplacement = '28'.tr;
    adresse = TextEditingController();
    surface = TextEditingController();
    prix = TextEditingController();
    iduser = myServices.sharedPreferences.getInt("iduser");
    mr = TextEditingController();
    selectDevise = '42'.tr;
    selectUnite ='47'.tr;
    super.onInit();
  }

  @override
  void dispose() {
    adresse.dispose();
    surface.dispose();
    prix.dispose();
    mr.dispose();

    super.dispose();
  }
  
  @override
  creerCompte() {
    Get.toNamed(AppRoutes.register);
  }
}