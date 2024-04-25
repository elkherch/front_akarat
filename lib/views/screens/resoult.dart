import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/trip_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReloultScreen extends StatelessWidget {
  const ReloultScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = Get.put(biensImmobiliersControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '32'.tr),
      body: GetBuilder<biensImmobiliersControllerImp>(
        id:"bien_resoult",
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child:controller.rechercheData.isEmpty
                      ?  Center(child: Text('180'.tr))
                : ListView.builder(
                  itemCount: controller.rechercheData.length,
                  itemBuilder: (context, index) {
                    final bien = controller.rechercheData[index];
                    String? imageUrl;
                    if (bien.images != null && bien.images!.isNotEmpty) {
                      String imagePath = bien.images![0];
                      if (!imagePath.startsWith("http://") && !imagePath.startsWith("https://")) {
                        imageUrl = "http://khdev.pythonanywhere.com" + imagePath;
                      } else {
                        imageUrl = imagePath; // L'image a déjà une URL complète
                      }
                    }
                    return TripBiens(
                      onpressed: (){controller.createFavorie(bien);},
                      allImages: bien.images,
                      title: bien.categorie ?? "default value",
                      surface: "${bien.surface ?? "default value"}",
                      lien: "${bien.adresse ?? "default value"}",
                      prix: "${bien.prix ?? "default value"}",
                      idbien: bien.bienID ?? 0, 
                      nombre_de_salles_de_bains: bien.nombre_de_salles_de_bains ?? 0, 
                      nombre_de_salles_de_sals: bien.nombre_de_salles_de_sals ?? 0,
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
