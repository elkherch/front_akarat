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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
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
          bottomNavigationBar: BottomNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: GetBuilder<biensImmobiliersControllerImp>(
            builder: (controller) {
              return _buildBody(_currentIndex);
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
                title: '5'.tr,
                icon: Icons.person,
                onTap: () {
                  controller.parametre();
                },
              ),
              DrawerItem(
                title: '6'.tr,
                icon: Icons.add_box,
                onTap: () {
                  controller.addAnnoce();
                },
              ),
              DrawerItem(
                title: '7'.tr,
                icon: Icons.announcement,
                onTap: () {
                  controller.annonce();
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

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const  HomeScreen();
      case 1:
        return const FavorieScreen();
      case 2:
        return const MapScreen();
      default:
        return const HomeScreen();
    }
  }
}
