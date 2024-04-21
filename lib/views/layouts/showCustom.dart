// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAjouteDaialog (){
  showDialog(
  context: Get.context!,
  builder: (BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.closed_caption_disabled, color: Colors.red, size: 64),
          const SizedBox(height: 16),
          Text(
            '91'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      actions: [
        
        Row(children: [
           ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.register);
          },
          child: Text("S'inscrire" ,style: Theme.of(context).textTheme.headline4,),
        ),
        Spacer(),
          ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Fermer" ,style: Theme.of(context).textTheme.headline4,),
        ),
        ],)
      ],
    );
  },
);
}