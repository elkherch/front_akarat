import 'dart:convert';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
   static const String _userIdKey = 'iduser';
   static const String _isAdminKey = 'isAdministrateur';
   static const String _utilisateurExiste = 'utilisateurExiste';
  
  Future<void> setIsAdmin(bool isAdmin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isAdminKey, isAdmin);
  }
  Future<void> setutilisateurExiste(bool utilisateurExiste) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_utilisateurExiste, utilisateurExiste);
  }
  Future<void> setUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, userId);
  }

  
  Future<Map<String, dynamic>?> signUp(String url, Map data) async {
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic>? responseData = json.decode(response.body);
      return responseData;
    } else {
      print("Error");
      throw "Error during HTTP request: ${response.statusCode}";
    }
  } catch (e) {
    throw "Error during HTTP request: $e";
  }
}

  Future<Map<String, dynamic>?> signIn(String url, Map data) async {
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Retourne un dictionnaire
      Map<String, dynamic>? responseData = json.decode(response.body);
      return responseData;
    } else {
      throw "Error during HTTP request: ${response.statusCode}";
    }
  } catch (e) {
    throw "Error during HTTP request: $e";
  }
}
 Future<List<Map<String, dynamic>>> fetchUser(String url, Map data) async {
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Accédez à la liste des utilisateurs dans la réponse JSON
      Map<String, dynamic> responseData = json.decode(response.body);
      Map<String, dynamic> userList = responseData['list_users'];

      // Créez une liste d'objets à partir des données de chaque utilisateur
      List<Map<String, dynamic>> usersList = [];
      userList.forEach((key, value) {
        usersList.add(value);
      });

      return usersList;
    } else {
      throw "Error during HTTP request: ${response.statusCode}";
    }
  } catch (e) {
    throw "Error during HTTP request: $e";
  }
}
void updateUserData(int userId) {
  // Récupérer le contrôleur associé à la page Paramètre
  var controller = Get.find<biensImmobiliersControllerImp>();
  var controllerParametre = Get.find<Informations1ControllerImp>();
  // Mettre à jour les données utilisateur dans le contrôleur
   controller.iduser = userId;
   controller.update(['bien_parametre']);
   controllerParametre.iduser = userId;
  // Déclencher une mise à jour de l'interface utilisateur pour refléter les nouvelles données utilisateur
  controllerParametre.update(['bien_p1']);
}
void updateUser() {
  var controllerParametre = Get.find<Informations1ControllerImp>();
  controllerParametre.update(['bien_p1']);
}
}