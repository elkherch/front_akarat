
// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/models/details_bien.dart';
import 'package:akarat/utils/statusRequest.dart';
import 'package:akarat/views/layouts/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'  as http;
import 'package:image_picker/image_picker.dart';
class CrudPost {
  Future<Either<StatusRequest, List<Details_immobiliers>>> postData(String url, Map data) async {
  try {
    if (await CheckInternet()) {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonData = json.decode(response.body)['list_biens'];
        List<Details_immobiliers> details = jsonData.map((json) => Details_immobiliers.fromJson(json)).toList();
        return Right(details);
      } else {
        return Left(StatusRequest.serveurfailure);
      }
    } else {
      return Left(StatusRequest.offlinefailure);
    }
  } catch (e) {
     throw "Error during HTTP request: $e";
  }
}
  Future<void> deleteItem(int bien_id) async {
    final url = 'http://10.0.2.2:8000/delete_bien/$bien_id/'; // Remplacez cette URL par l'URL de votre API Django pour la suppression
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Échec de la suppression de l\'élément: ${response.statusCode}');
    }
  }
  Future<Either<StatusRequest, List<Biens_immobiliers>>> rechercheData(String url, Map data) async {
  try {
    if (await CheckInternet()) {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonData = json.decode(response.body)['list_biens'];
        List<Biens_immobiliers> biens = jsonData.map((json) => Biens_immobiliers.fromJson(json)).toList();
        return Right(biens);
      } else {
        return Left(StatusRequest.serveurfailure);
      }
    } else {
      return Left(StatusRequest.offlinefailure);
    }
  } catch (e) {
     throw "Error during HTTP request: $e";
  }
}
  
  void updateUserData() {
  var controller = Get.find<biensImmobiliersControllerImp>();
  controller.update(['bien_home', 'bien_main']);
  
}
Future<Map<String, Biens_immobiliers>> createImmobilie(String url, Map<String, dynamic> data, List<XFile> imageList) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    // Ajoutez les champs de données au formulaire multipart
    request.fields.addAll({
      'type_de_bien': "Teste",
      'prix': data['prix']?.toString() ?? '',
      'surface': data['surface']?.toString() ?? '',
      'nombre_de_salles_de_bains': data['nombre_de_salles_de_bains'] ?? '',
      'nombre_de_salles_de_sals': data['nombre_de_salles_de_sals'] ?? '',
      'description': data['description'] ?? '',
      'region': data['region'] ?? '',
      'emplacement': data['emplacement'] ?? '',
      'categorie': data['categorie'] ?? '',
      'adresse': data['adresse'] ?? '',
      'date_publication': "2022-02-02T00:00:00",
      'id_user': data['id_user']?.toString() ?? '',
    });
    // Ajoutez les fichiers image au formulaire multipart
    for (var imageFile in imageList) {
      request.files.add(await http.MultipartFile.fromPath('images', imageFile.path));
    }
    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = json.decode(responseData);
      
      // Traitement de la réponse JSON pour extraire les données pertinentes
      Biens_immobiliers immo = Biens_immobiliers.fromJson(jsonData);
      
      // Création d'un Map avec une clé arbitraire pour stocker l'objet Biens_immobiliers
      Map<String, Biens_immobiliers> resultMap = {'immobilier': immo};
      
      return resultMap;
    } else {
      throw "Error during HTTP request: ${response.statusCode}";
    }
  } catch (e) {
    throw "Error during HTTP request: $e";
  }
}
}
class CrudGet {
  Future<Either<StatusRequest, List<Biens_immobiliers>>> getData(String url) async {
    try {
      if (await CheckInternet()) {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200 || response.statusCode == 201) {
          List<dynamic> data = json.decode(response.body)['list_biens'];
          List<Biens_immobiliers> biens = data.map((json) => Biens_immobiliers.fromJson(json)).toList();
          return Right(biens);
        } else {
          return Left(StatusRequest.serveurfailure);
        }
      } else {
        return Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
       throw "Error during HTTP request: $e";
    }
  }
}
