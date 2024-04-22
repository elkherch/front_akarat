// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:akarat/models/details_bien.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:get/get.dart';

import '../services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';
abstract class BiensImmobillers extends GetxController{
  getDataDetais();
}
class BiensImmobillersImp extends BiensImmobillers {
   late RxList<Details_immobiliers> dataDetais;
  final CrudPost _crudPost = CrudPost();
  
  @override
  void onInit() {
    dataDetais = <Details_immobiliers>[].obs;
    getDataDetais();
    super.onInit();
  }
 void getDataDetais() async {
  try {
    final bienId = Get.arguments['idbien'].toString();
    print(bienId);
    final List<Details_immobiliers> apiDataDetais =
        await _crudPost.postData(Apilink.details_biens, {"idbien": bienId});
    dataDetais.assignAll(apiDataDetais);
    print("+===================================$dataDetais");
  } catch (e) {
    print('Error fetching 09 dataDetais: $e');
  }
}

}
