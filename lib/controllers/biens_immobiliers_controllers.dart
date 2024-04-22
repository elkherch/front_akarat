import 'package:akarat/bien.dart';
import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/models/details_bien.dart';
import 'package:akarat/services/AuthService/auth_service.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/layouts/showCustom.dart';
import 'package:akarat/views/screens/annonce.dart';
import 'package:akarat/views/screens/main_screen.dart';
import 'package:akarat/views/themes/api.dart';
import 'package:akarat/views/themes/routes.dart';
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
  goToDetails(int bienId);
}

class biensImmobiliersControllerImp extends biensImmobiliersController{
  RxList<Biens_immobiliers> biens = <Biens_immobiliers>[].obs;
   RxList<Details_immobiliers> listeData =<Details_immobiliers>[].obs ;
   RxList<Biens_immobiliers> rechercheData =<Biens_immobiliers>[].obs ;

  RxBool isLogged = false.obs;
   int? iduser;
  final Myservices myServices = Get.find();
  Map<String, dynamic>? dataLogin;
  late TextEditingController nomUser;
  late TextEditingController password;
  final CrudGet _crudGet = CrudGet();
  
  late List<Biens_immobiliers> data1 = [];

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
  goToDetails(int bienId) {
    Get.toNamed(AppRoutes.tripdetails, arguments: {'idbien': bienId});
  }
  @override
  Future<void> getDataListe() async {
  try {
    final List<Details_immobiliers> apiDataDetais =
    await _crudPost.postData(Apilink.liste_favorie, {"iduser": iduser});
    listeData.assignAll(apiDataDetais);
    print("+===================================$listeData");
  } catch (e) {
    print('Error fetching 09 dataDetais: $e');
  }
}
  @override
  Future<void> goTorechercher(String categorie,String emplacement, String region) async {
  try {
    print(categorie);
    print(emplacement);
    print(region);
    final List<Biens_immobiliers> apiDataRecherche =
    await _crudPost.rechercheData(Apilink.recherche_bien, {"categorie": categorie,"emplacement":emplacement,"region":region});
    rechercheData.assignAll(apiDataRecherche);
    update(['bien_resoult']);
    Get.toNamed(AppRoutes.recherche);
    print("+===================================$rechercheData");
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
    nomUser = TextEditingController();
    password = TextEditingController();
    getBiens();
    iduser = myServices.sharedPreferences.getInt("iduser") ?? 0;
    utilisateurExiste.value = myServices.sharedPreferences.getBool("utilisateurExiste") ?? false;
    verifierUtilisateur();
    biens = <Biens_immobiliers>[].obs;
      getDataListe();
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
    Get.snackbar(
      'Success',
      'Property added to favorites',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  
  }
   
    @override
  goToCreer() async {
  try {
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

      update();
      _crudPost.updateUserData();
      getBiens();

      data2 = apiData.values.toList();
      
      // Utilisez Get.off pour aller à la nouvelle page et remplacer l'ancienne dans la pile de navigation
      Get.off(const MainScreen());
    } else {
      print('User does not exist....');
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
    try {
      List<Biens_immobiliers> newData = await _crudGet.getData(Apilink.list_biens);
      biens.assignAll(newData);
      update();
      print("Data from API:=========================================== $biens['images']");
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
 @override
goTo() async {
  var formdata = formkeyAuth.currentState;
  if (formdata!.validate()) {
    dataLogin = await authService.signIn(Apilink.user_login, {
      "username": nomUser.text,
      "password": password.text
    });
    print(dataLogin);
    if (dataLogin!['success']) {
      print(dataLogin!['user_id']);
      myServices.sharedPreferences.setBool("utilisateurExiste", true);
      myServices.sharedPreferences.setInt("iduser", dataLogin!['user_id']);
      // Mettre à jour l'état du contrôleur après la connexion
      authService.updateUserData(dataLogin!['user_id']);
      update(['bien_parametre']);
      // Naviguer vers l'écran des paramètres
      Get.off(const MainScreen());

    }
  } else {
    print("object");
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
    update(['bien_favorie']);
    Get.off(const Annonce());
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
    if (iduser != 0) {
     Get.toNamed(AppRoutes.publicite);
    }else{
      showAjouteDaialog();
    }
  }
  
  
}