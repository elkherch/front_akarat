// import 'package:get/get.dart';
// import 'package:akarat/services/AuthService/auth_service.dart';
// import 'package:akarat/services/services.dart';
// import 'package:akarat/views/themes/api.dart';
// import 'package:akarat/views/themes/routes.dart';
// import 'package:flutter/material.dart';

// abstract class LoginController extends GetxController {
//   signUp();
//   goTo();
// }

// class LoginControllerImp extends LoginController {
//   late TextEditingController nom;
//   late TextEditingController password;

//   final AuthService authService = AuthService();
//   Myservices myServices = Get.find();
//   Map<String, dynamic>? dataLogin;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   signUp() async {
//     Get.toNamed(AppRoutes.register);  
//   }

//   @override
// goTo() async {
//   var formdata = formkey.currentState;
//   if (formdata!.validate()) {
//     dataLogin = await authService.signIn(Apilink.user_login, {
//       "username": nom.text,
//       "password": password.text
//     });
//     print(dataLogin);
//     if (dataLogin!['success']) {
//       print(dataLogin!['user_id']);
//       myServices.sharedPreferences.setBool("utilisateurExiste", true);
//       myServices.sharedPreferences.setInt("iduser", dataLogin!['user_id']);

//       // Mettre à jour l'état du contrôleur après la création du compte
//       update();
//     }
//     // Naviguer vers l'écran de paramètres ou d'ajout d'annonce en fonction de la condition
//     if (myServices.sharedPreferences.getInt('iduser') != 0) {
//       Get.toNamed(AppRoutes.parametre , arguments: {'user_id': dataLogin!['user_id']});
//     } else {
//       Get.toNamed(AppRoutes.add_annonce);
//     }
//   } else {
//     print("object");
//   }
//   print("1");
// }


//   @override
//   void onInit() {
//     nom = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     nom.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }