// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/screens/favorie_screen.dart';
import 'package:akarat/views/screens/home_screen.dart';
import 'package:akarat/views/screens/map_screen.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/bottom_nav_bar.dart';
import 'package:akarat/views/widgets/custom_app_bar.dart';
import 'package:akarat/views/widgets/drawer.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final biensImmobiliersControllerImp controller =
      Get.put(biensImmobiliersControllerImp());

  @override
  Widget build(BuildContext context) {

    return GetBuilder<biensImmobiliersControllerImp>(
      id: "bien_main",
      init: biensImmobiliersControllerImp(),
      builder: (context) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            title: "1".tr,
            onSearchPressed: () {
              controller.rechercher();
            },
            onDrawerPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            isFrench: false,
          ),
          
          body: GetBuilder<biensImmobiliersControllerImp>(
            builder: (controller) {
              return const HomeScreen();
            },
          ),
          drawer: AppDrawer(
            drawerItems: [
              DrawerItem(
                title: '8'.tr,
                icon: Icons.language,
                onTap: () {
                  controller.choixLangue();
                },
              ),
              
              DrawerItem(
                title: '6'.tr,
                icon: Icons.add_box,
                onTap: () {
                  controller.addAnnoce();
                },
              ),
            ],
          ),
          floatingActionButton:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
     children: [
      TextButton(
      onPressed: () {
      controller.addannonce();
      },
      child:  Row(
        children: [
           const Icon(
              Icons.add,
              color: AppColor.backgroundcolor,
            ),
          const SizedBox(width: 8), // Espacement entre l'icône et le texte
          Text(
            '46'.tr, // Texte du bouton WhatsApp
            style: const TextStyle(
              color: AppColor.backgroundcolor, // Couleur du texte
              fontSize: 16, // Taille du texte
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        
        backgroundColor: MaterialStateProperty.all(AppColor.whiteColor), // Couleur de fond du bouton
      ),
    ),
    
  ],
),
        );
      }
    );
  }
}
