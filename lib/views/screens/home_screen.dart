import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/widgets/trip_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<biensImmobiliersControllerImp>(
        id: "bien_home",
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
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
                      lien: "${bien.adresse ?? "default value"}",
                      prix: "${bien.prix ?? "default value"}",
                      idbien: bien.bienID ?? 0,
                      nombre_de_salles_de_bains:
                          bien.nombre_de_salles_de_bains ?? 0,
                      nombre_de_salles_de_sals:
                          bien.nombre_de_salles_de_sals ?? 0,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
