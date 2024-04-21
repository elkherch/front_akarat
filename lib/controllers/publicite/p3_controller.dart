// // ignore_for_file: unused_local_variable

// import 'package:akarat/models/biens_immobiliers_models.dart';
// import 'package:akarat/services/AuthService/auth_service.dart';
// import 'package:akarat/services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';
// import 'package:akarat/services/services.dart';
// import 'package:akarat/views/themes/api.dart';
// import 'package:akarat/views/themes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// abstract class Informations3Controller extends GetxController {
//   signUp();
//   goToCreer();
//   selectImage();
// }
// class Informations3ControllerImp extends Informations3Controller {
  

//   Myservices myServices = Get.find();

//   late String selectedAccountType2;
//   bool inConducteur = false;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile> imageXFileList =[];
//   final AuthService authService = AuthService();
//   late List<Biens_immobiliers> data = [];
//   final CrudPost _crudPost = CrudPost();
//   @override
//   selectImage() async{
//     final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
//     if (selectedImage!.isNotEmpty) {
//       imageXFileList.addAll(selectedImage);
//     }
//     for (var element in imageXFileList) {
//       print(element);
//     }
//     update();
//   }
//   @override
// goToCreer() async {
//     try {
//       String typeAnnonce = Get.arguments['type_de_bien'].toString();
//       String description = Get.arguments['description'].toString();
//       String categorie = Get.arguments['categorie'].toString();
//       String prix = Get.arguments['prix'].toString();
//       String surface = Get.arguments['surface'].toString();
      
//       int? iduser = myServices.sharedPreferences.getInt("iduser");
//       if (iduser != 0) {
//         // Créer un Map contenant les données immobilières
//         Map<String, dynamic> immoData = {
//           "type_de_bien": typeAnnonce,
//           "prix": prix,
//           "surface": surface,
//           "nombre_de_salles_de_bains": 3,
//           "nombre_de_salles_de_sals": 4,
//           "description": description,
//           "lien": 'nouakchott',
//           "date_publication": "2022-02-02T00:00:00",
//           "id_user": 1,
//         };

//         // Appeler la méthode createImmobilie avec les données immobilières et la liste d'images
//         Map<String, Biens_immobiliers> apiData = await _crudPost.createImmobilie(
//           Apilink.createImmobilie,
//           immoData,
//           imageXFileList,
//         );

//         // Mettre à jour la liste de données avec les résultats de l'appel API
//         data = apiData.values.toList();

//         // Naviguer vers la page de publicité 3
//         Get.toNamed(AppRoutes.home);
//       } else {
//         print('User does not exist....');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
// }



//   @override
//   void onInit() {
//     selectedAccountType2 = 'client'; // Initialisation de selectedAccountType à 'client'
//     super.onInit();
//   }

//   @override
//   void dispose() {

//     super.dispose();
//   }
  
//   @override
//   signUp() {
//   }
// }
