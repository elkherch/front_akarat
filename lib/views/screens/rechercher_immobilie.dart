import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechercherImmobilie extends StatefulWidget {
  const RechercherImmobilie({Key? key}) : super(key: key);

  @override
  State<RechercherImmobilie> createState() => _RechercherImmobilieState();
}

class _RechercherImmobilieState extends State<RechercherImmobilie> {
  TextEditingController villeController = TextEditingController();
  TextEditingController prixController = TextEditingController();
  List<String> resultats = [];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarCustam(title: '32'.tr),
      body:const  Center(
        child:Text(
          "Cette page est en cours de développement.",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
    );
  }
}
