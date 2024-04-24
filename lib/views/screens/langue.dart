// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, camel_case_types, file_names

import 'package:akarat/views/layouts/changelangue.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class langue extends GetView<LocalController> {
  const langue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'fr';
    return Scaffold(
     appBar: AppBarCustam(title: '8'.tr),

      body: Column(
        children: [
          ListTile(
            title: Text('Français'),
            onTap: () {
              selectedLanguage = 'fr';
            },
            selected: selectedLanguage == 'fr', 
          ),
          ListTile(
            title: Text('العربية'),
            onTap: () {
              selectedLanguage = 'ar';
            },
            selected: selectedLanguage == 'ar', 
          ),
          ElevatedButton(
            onPressed: () {
              controller.changeLang(selectedLanguage);
              selectedLanguage = selectedLanguage;
            },
            child: Text('Changer de Langue'),
          ),
        ],
      ),
    );
  }
}
