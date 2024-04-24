import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/layouts/handingdataview.dart';
import 'package:akarat/views/themes/imagesAsset.dart';
import 'package:akarat/views/widgets/trip_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<biensImmobiliersControllerImp>(
        id: "bien_home",
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
          return  HandlingDataRequest(statusRequest:controller.statusRequest,
            widget:   
          Column(
            children: [
              Expanded(
                child: controller.biens.isEmpty
                      ? Center(child: Text('180'.tr))
                :  ListView.builder(
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
                    return TripBiens(
                      onpressed: () {
                        controller.createFavorie(bien);
                      },
                      imageUrl: imageUrl,
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
          )
          );
        },
      
    );
  }
}
