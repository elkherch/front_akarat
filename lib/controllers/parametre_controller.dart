import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:get/get.dart';

abstract class ParametreController extends GetxController {
  void verifierUtilisateur();
  void nouvelCompte();
}

class ParametreControllerImp extends ParametreController {
  final Myservices myServices = Get.find();
  RxBool utilisateurExiste = false.obs;
  int? iduser;
  RxList<Map<String, dynamic>> dataParametre = <Map<String, dynamic>>[].obs; // Utilisez RxList<Map<String, dynamic>>

  final AuthService authService = AuthService();
  @override
  void onInit() {
    utilisateurExiste.value = myServices.sharedPreferences.getBool("utilisateurExiste") ?? false;
    iduser = myServices.sharedPreferences.getInt("iduser") ?? 0;
    super.onInit();
    verifierUtilisateur();
  }

  @override
  void verifierUtilisateur() async {
    try {
      List<Map<String, dynamic>> userdataParametre = await authService.fetchUser(Apilink.fethUser, {
        "iduser": iduser,
      });
      dataParametre.assignAll(userdataParametre);
      utilisateurExiste.value = true; // Mettre à jour l'état de l'utilisateur
    } catch (e) {
      print("Error fetching user dataParametre: $e");
    }
  }

  @override
  void nouvelCompte() {
    Get.toNamed(AppRoutes.register);
  }
}
