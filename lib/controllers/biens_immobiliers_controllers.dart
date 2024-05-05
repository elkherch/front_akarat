// ignore_for_file: camel_case_types

import 'dart:ffi';

import 'package:akarat/bien.dart';
import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/models/details_bien.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/utils/statusRequest.dart';
import 'package:akarat/views/DashboardAdmin/adminScreen.dart';
import 'package:akarat/views/layouts/show.dart';
import 'package:akarat/views/layouts/showCustom.dart';
import 'package:akarat/views/screens/main_screen.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:akarat/views/widgets/trip_detail_biens.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';

abstract class biensImmobiliersController extends GetxController{
  getBiens();
  rechercher();
  annonce();
  createFavorie(Biens_immobiliers bien);
  addAnnoce();
  choixLangue();
 deleteItem(int bienId);
 deleteBien(int bie);
  register();
  parametre();
  addannonce();
  selectImage();
  signUp();
  goToPublicite1();
  goToCreer();
  creerCompte();
  goTo();
  verifierUtilisateur();
  goTorechercher(String categorie,String emplacement, String region);
  getDataListe();
  goToDetails(int bienId,String title);
}

class biensImmobiliersControllerImp extends biensImmobiliersController{
  RxList<Biens_immobiliers> biens = <Biens_immobiliers>[].obs;
   RxList<Details_immobiliers> listeData =<Details_immobiliers>[].obs ;
   RxList<Biens_immobiliers> rechercheData =<Biens_immobiliers>[].obs ;

  RxBool isLogged = false.obs;
   int? iduser;
   bool isAdministrateur =false;

  final Myservices myServices = Get.find();
  Map<String, dynamic>? dataLogin;
  late TextEditingController nomUser;
  late TextEditingController password;
  final CrudGet _crudGet = CrudGet();
  RxBool isAdmin = false.obs;
  
  late List<Biens_immobiliers> data1 = [];
  RxBool isLoading = false.obs;
  RxBool isLoadingCreerBien = false.obs;
  
  final AuthService authService = AuthService();
  RxBool utilisateurExiste = false.obs;
  RxList<Map<String, dynamic>> dataParametre = <Map<String, dynamic>>[].obs; // Utilisez RxList<Map<String, dynamic>>

  late String? data3; 
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkeyAuth = GlobalKey<FormState>();
  List<XFile> imageXFileList =[];
  late List<Biens_immobiliers> data2 = [];
  final ImagePicker imagePicker = ImagePicker();
  final CrudPost _crudPost = CrudPost();
     StatusRequest statusRequest = StatusRequest.none;

  bool active =false;
  @override
  selectImage() async{
    final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      imageXFileList.addAll(selectedImage);
    }
    for (var element in imageXFileList) {
      print(element);
    }
    update();
  }
  @override
  signUp() async {
   Get.toNamed(AppRoutes.register); 
  }
  
  @override
  goToDetails(int bienId, String title) {
    Get.to( TripDetailsBiens(title: title,) , arguments: {'idbien': bienId});
  }
  @override
  Future<void> getDataListe() async {
  print(iduser);
  try {
    final Either<StatusRequest, List<Details_immobiliers>> apiDataDetailsEither =
        await _crudPost.postData(Apilink.user_favorie, {"iduser": iduser});

    apiDataDetailsEither.fold(
      (failure) {
        print('Request failed with status: $failure');
      },
      (data) {
        statusRequest = StatusRequest.success;
        listeData.assignAll(data);
        print('+===================================$listeData');
      },
    );
  } catch (e) {
    // Gérer les erreurs ici
    print('Error fetching dataDetails: $e');
    statusRequest = StatusRequest.failure;
  }
}
  @override
  Future<void> goTorechercher(String categorie,String emplacement, String region) async {
  try {
    print(categorie);
    print(emplacement);
    print(region);
    statusRequest = StatusRequest.loading;

    final Either<StatusRequest, List<Biens_immobiliers>> apiDataRecherche =
    await _crudPost.rechercheData(Apilink.recherche_bien, {"categorie": categorie,"emplacement":emplacement,"region":region});
    apiDataRecherche.fold(
      (failure) {
        statusRequest = StatusRequest.offlinefailure;
        print('Request failed with status: $failure');
      },
      (data) {
        statusRequest = StatusRequest.success;
        rechercheData.assignAll(data);
        update(['bien_resoult']);
         Get.toNamed(AppRoutes.recherche);
        print('+===================================$listeData');
      },
    );
  } catch (e) {
    print('Error fetching 09 dataDetais: $e');
  }
}
  @override
  goToPublicite1() {
    Get.toNamed(AppRoutes.publicite);
  }

  @override
  void onInit() {
    super.onInit();  
    getBiens();
    nomUser = TextEditingController();
    password = TextEditingController();
    iduser = myServices.sharedPreferences.getInt("iduser") ?? 0;
    isAdministrateur = myServices.sharedPreferences.getBool("isAdministrateur") ?? false;
    utilisateurExiste.value = myServices.sharedPreferences.getBool("utilisateurExiste") ?? false;
    verifierUtilisateur();
    getDataListe();
    biens = <Biens_immobiliers>[].obs;
    update(['bien_home']);
  }
  @override
  void verifierUtilisateur() async {
    try {
      List<Map<String, dynamic>> userData = await authService.fetchUser(Apilink.fethUser, {
        "iduser": iduser,
      });
      dataParametre.assignAll(userData);
      dataParametre.forEach((user) {
        print("Username: ${user['username']}");
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
   @override
  Future<void> createFavorie(Biens_immobiliers bien) async {
  final biensImmobilier = Biens_immobilieHive(
      bienID: bien.bienID,
      type_de_bien: bien.type_de_bien,
      prix: bien.prix,
      surface: bien.surface, 
      nombre_de_salles_de_bains: bien.nombre_de_salles_de_bains,
      nombre_de_salles_de_sals: bien.nombre_de_salles_de_sals,
      images: bien.images,
      description: bien.description,
      emplacement: bien.emplacement,
      region: bien.region,
      adresse: bien.adresse,
      categorie: bien.categorie,
      id_user: bien.id_user,
      coordonnees_geographique:bien.coordonnees_geographique,
      date_publication: bien.date_publication
    );
     active=true;
     update(['trip_bien','bien_home']);
    final box = await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
    await box.add(biensImmobilier);
    
  }
   
    @override
  goToCreer() async {
    isLoadingCreerBien.value = true;
  try {
    if(imageXFileList.isNotEmpty){
    String typeAnnonceT = Get.arguments['type_de_bien'].toString();
    String descriptionT = Get.arguments['description'].toString();
    String prixT = Get.arguments['prix'].toString();
    String surfaceT = Get.arguments['surface'].toString();
    String nombre_de_salles_de_bains = Get.arguments['nombre_bains'].toString();
    String nombre_de_salles_de_sals = Get.arguments['nombre_sals'].toString();
    String cat = Get.arguments['categorie'].toString();
    String adr = Get.arguments['adresse'].toString();
    String empl = Get.arguments['emplacement'].toString();
    String reg = Get.arguments['region'].toString();

    
    int? iduser = myServices.sharedPreferences.getInt("iduser");
    if (iduser != 0) {
      print(typeAnnonceT);
      print(descriptionT);
      print(prixT);
      print(surfaceT);
      print(nombre_de_salles_de_sals);
      print(nombre_de_salles_de_bains);
      print(cat);
      print(adr);
      print(empl);
      print(reg);

      // Créer un Map contenant les données immobilières
      Map<String, dynamic> immoData = {
        "type_de_bien": typeAnnonceT,
        "prix": prixT,
        "surface": surfaceT,
        "nombre_de_salles_de_bains": nombre_de_salles_de_bains,
        "nombre_de_salles_de_sals": nombre_de_salles_de_sals,
        "description": descriptionT,
        "date_publication": "2022-02-02T00:00:00",
        "categorie": cat,
        "adresse": adr,
        "emplacement": empl,
        "region": reg,
        "id_user":iduser

      };

      // Appeler la méthode createImmobilie avec les données immobilières et la liste d'images
      Map<String, Biens_immobiliers> apiData = await _crudPost.createImmobilie(
        Apilink.createImmobilie,
        immoData,
        imageXFileList,
      );
      if (isAdministrateur) {
        update();
        _crudPost.updateAdminData();
        getBiens();
        data2 = apiData.values.toList();
        isLoadingCreerBien.value=false;
        Get.off(const AdminScreen());
      } else {
        update();
        _crudPost.updateUserData();
        getBiens();
        data2 = apiData.values.toList();
        isLoadingCreerBien.value=false;
        Get.off(const MainScreen());
      }
    }
    else{
      
    }
    } 
    else {
      isLoadingCreerBien.value = false;
      showDaialog('186'.tr, '191'.tr);
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
  @override
  void dispose() {
    nomUser.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  creerCompte() {
    Get.toNamed(AppRoutes.register);
  }
 @override
  Future<void> getBiens() async {
    isLoading.value = true;

      statusRequest = StatusRequest.loading;

    try {
      final Either<StatusRequest, List<Biens_immobiliers>> newData = await _crudGet.getData(Apilink.list_biens);
      newData.fold(
      (failure) {
        statusRequest = StatusRequest.offlinefailure;
        print('Request failed with status: $failure');
        getBiens();

      },
      (data) {
        statusRequest = StatusRequest.success;
        biens.assignAll(data);
         isLoading.value = false;

        update();
        update(['bien_home']);
        update(['screen_home']);

      },
    );
   
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  @override
  goTo() async {
    isLoading.value = true;
   try {
    dataLogin = await authService.signIn(Apilink.user_login, {
      "username": nomUser.text,
      "password": password.text
    });
    print(dataLogin);
    if (dataLogin!['success']) {
      print(dataLogin!['user_id']);
      myServices.sharedPreferences.setBool("utilisateurExiste", true);
      myServices.sharedPreferences.setInt("iduser", dataLogin!['user_id']);
      authService.updateUserData(dataLogin!['user_id']);
      isLoading.value = false;
      update(['bien_parametre']);
      if (dataLogin!['is_superuser']) {
        myServices.sharedPreferences.setBool("isAdministrateur", true);
        isAdmin.value = true;
        Get.off(const AdminScreen());
        
      } else {
        Get.off(const MainScreen());
      }
    }
    else{
      isLoading.value = false;
      showDaialog('186'.tr, '187'.tr);
    }
   }catch (e) {
      isLoading.value = false;
      showDaialog('186'.tr,'185'.tr);
    }
  
}
  @override
  rechercher() {
    Get.toNamed(AppRoutes.rechercher);
  }
  @override
  addAnnoce() {
    Get.toNamed(AppRoutes.publicite);
  }
  @override
  annonce() {
    getDataListe();
    Get.toNamed(AppRoutes.annonce);
  }
  @override
  deleteItem(int bie) async {
    try {
      await _crudPost.deleteItem(bie);
      update(['bien_liste']);
      getDataListe();
      print("delete avec sucess");
    } catch (e) {
      print("delete error");
    }
  }
  @override
  Future<void> deleteBien(int bie) async {
    isLoading.value = true;
    try {
      await _crudPost.deleteItem(bie);
      print("delete avec sucess");
      update();
      _crudPost.updateAdminData();
      getBiens();
      isLoading.value = false;
      Get.off(const AdminScreen());
    } catch (e) {
      print("delete error");
    }
  }
  @override
  register() {
    Get.toNamed(AppRoutes.register);
  }
  @override
  parametre() {
      Get.toNamed(AppRoutes.parametre);
  }
 @override
  addannonce() {
    update(['bien_p1']);
    if (iduser != 0) {
      
     Get.toNamed(AppRoutes.publicite);
    }else{
      showAjouteDaialog();
    }
  }
  @override
  choixLangue() {

    Get.toNamed(AppRoutes.langue);
  }

  void logout() async {
    await authService.setUserId(0);
    await authService.setIsAdmin(false);
    await authService.setutilisateurExiste(false);
    iduser = 0;
    isAdministrateur =false;
    isAdmin = false.obs;
    update();
    _crudPost.updateAdminData();
    _crudPost.updateUserData();
    print(iduser);
    print(isAdministrateur);
    Get.toNamed(AppRoutes.main);
  }
}