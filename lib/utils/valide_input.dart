// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get/get.dart';

ValideInput(String val,int min ,int max ,String type){
  
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "nom d'utilisateur non valide";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "email d'utilisateur non valide";
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "numerotel d'utilisateur non valide";
    }
  }

  if(val.length < min) {
      return "champ ne peut pas etre inferieur $min";
  }

  if(val.length > max) {
      return "champ ne peut pas etre superieur $max";
  }
}