// ignore_for_file: unused_local_variable

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/widgets/bien_admin.dart';
import 'package:akarat/views/widgets/trip_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<biensImmobiliersControllerImp>(
        id: "admin_home",
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
          return 
           Stack(
             children: [
               Column(
                children: [
                  Expanded(
                    child:ListView.builder(
                      itemCount: controller.biens.length,
                      itemBuilder: (context, index) {
                        final bien = controller.biens[index];
                        String? imageUrl;
                        if (bien.images != null && bien.images!.isNotEmpty) {
                          String imagePath = bien.images![0];
                          if (!imagePath.startsWith("http://") &&
                              !imagePath.startsWith("https://")) {
                            imageUrl =
                                "http://khdev.pythonanywhere.com" + imagePath;
                          } else {
                            imageUrl = imagePath; // L'image a déjà une URL complète
                          }
                        }
                        return BiensAdmin(
                          onpressed: () {
                            controller.deleteBien(bien.bienID!);
                          },
                          allImages: bien.images,
                          title: bien.categorie ?? "default value",
                          surface: "${bien.surface ?? "default value"}",
                          lien: "${bien.region ?? "default value"}",
                          prix: "${bien.prix ?? "default value"}",
                          idbien: bien.bienID ?? 0,
                          nombre_de_salles_de_bains:
                              bien.nombre_de_salles_de_bains ?? 0,
                          nombre_de_salles_de_sals:
                              bien.nombre_de_salles_de_sals ?? 0,
                        );
                      },
                    )
                    
                  ),
                ],
                         ),
                 Obx(() {
                   return controller.isLoading.value
                  ? Container(
                    color: Colors.black.withOpacity(0.5), // Opacité de l'arrière-plan
                    child:const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox.shrink();
          }),
             ],
           );
          
        },
      
    );
  }
}
