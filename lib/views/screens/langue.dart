// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, camel_case_types, file_names

import 'package:akarat/views/layouts/changelangue.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:akarat/views/widgets/bottom_langue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class langue extends GetView<LocalController> {
  const langue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("1".tr),
            SizedBox(height: 20),
            
            Mybutton(
              onpressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.main);
              },
              text: 'العربية',
            ),
            SizedBox(height: 20),
            Mybutton(
              onpressed: () {
                controller.changeLang("fr");
                Get.toNamed(AppRoutes.main);
              },
              text: 'Français',
            )
          ],
        ),
      ),
    );
  }
}
