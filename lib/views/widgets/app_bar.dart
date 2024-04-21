// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCustam extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  AppBarCustam( {
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundcolor,
      centerTitle: true,
      
          title: Text(title, style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor
          )),
        leading: IconButton(
        icon:const Icon(Icons.arrow_back , color: AppColor.whiteColor,), // Icône à gauche de l'AppBar
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
