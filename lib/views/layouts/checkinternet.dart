// ignore_for_file: non_constant_identifier_names, unused_local_variable, nullable_type_in_catch_clause

import 'dart:io';

CheckInternet() async {

  try {

    var result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty  && result[0].rawAddress.isNotEmpty){
      return true;
    }
    
  }catch (_) {
    return false;
  }

}