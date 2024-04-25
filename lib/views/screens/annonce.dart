import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/layouts/handingdataview.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/liste_annoce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Annonce extends StatelessWidget {
  const Annonce({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustam(title: '7'.tr),
      body: GetBuilder<biensImmobiliersControllerImp>(
        id: "bien_liste",
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
          return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                          itemCount: controller.listeData.length,
                          itemBuilder: (context, index) {
                            final bien = controller.listeData[index];
                            String? imageUrl;
                            if (bien.images != null &&
                                bien.images!.isNotEmpty) {
                              String imagePath = bien.images![0];
                              if (!imagePath.startsWith("http://") &&
                                  !imagePath.startsWith("https://")) {
                                imageUrl =
                                    "http://khdev.pythonanywhere.com" +
                                        imagePath;
                              } else {
                                imageUrl = imagePath;
                              }
                            }
                            return TripAnnonce(
                              imageUrl: imageUrl,
                              title: bien.type_de_bien ?? "default value",
                              surface:
                                  "${bien.surface ?? "default value"}",
                              lien: "${bien.adresse ?? "default value"}",
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
            );
          
        },
      ),
    );
  }
}
