// ignore_for_file: avoid_print

import 'package:akarat/services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:get/get.dart';
abstract class TripBienController extends GetxController{
  goToDetails(int bienId);
}
class TripBienControllerImp extends TripBienController {    
  @override
  goToDetails(int bienId) {
    Get.toNamed(AppRoutes.tripdetails, arguments: {'idbien': bienId});
  }
}
