
import 'package:akarat/utils/statusRequest.dart';

handlingData(reponse){
  if(reponse is StatusRequest){
   return reponse;
  }else{
    return StatusRequest.success;
  }
}