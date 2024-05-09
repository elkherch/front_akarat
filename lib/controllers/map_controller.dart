// ignore_for_file: avoid_print, unnecessary_null_comparison, deprecated_member_use

import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';
import 'package:akarat/utils/statusRequest.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class MapController extends GetxController{
  getData();
}
class MapControllerImp extends MapController {
  RxList<Biens_immobiliers> biens = <Biens_immobiliers>[].obs;
  RxBool isLoading = false.obs;
  StatusRequest statusRequest = StatusRequest.none;
  
  @override
  void onInit() {
    
    getData();
    super.onInit();
  }
  @override
  Future<void>  getData() async {
    // isLoading.value = true;

    statusRequest = StatusRequest.loading;
    final CrudGet _crudGet = CrudGet();
    try {
      final Either<StatusRequest, List<Biens_immobiliers>> newData = await _crudGet.getData(Apilink.list_biens);
      newData.fold(
      (failure) {
        statusRequest = StatusRequest.offlinefailure;
        print('Request failed with status: $failure');
        getData();

      },
      (data) {
        statusRequest = StatusRequest.success;
        biens.assignAll(data);
        print("object$biens.assignAll(data)");
        // isLoading.value = false;

        update();
        update(['map_screen']);
        update(['screen_home']);

      },
    );
   
    } catch (e) {
      print('Error fetching data: $e');
    }
  
  }  
}
