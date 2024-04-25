import 'package:akarat/bien.dart';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/trip_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavorieScreen extends StatelessWidget {
  const FavorieScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = Get.find<biensImmobiliersControllerImp>();
    return Scaffold(
      body: GetBuilder<biensImmobiliersControllerImp>(
        id: "bien_favorie",
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _getFavorieBiens(),
                  builder: (context, AsyncSnapshot<List<Biens_immobilieHive>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final favorieBiens = snapshot.data ?? []; // Liste des biens favoris
                      return ListView.builder(
                        itemCount: favorieBiens.length,
                        itemBuilder: (context, index) {
                          final bien = favorieBiens[index];
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
                            onpressed: () {
                              _deleteFavorieBiens(bien.bienID);
                              // Pas besoin de mettre à jour ici car GetBuilder le fait automatiquement
                            },
                            allImages: bien.images,
                            title: bien.type_de_bien ?? "default value",
                            surface: "${bien.surface ?? "default value"}",
                            lien: "${bien.adresse ?? "default value"}",
                            prix: "${bien.prix ?? "default value"}",
                            idbien: bien.bienID ?? 0,
                            nombre_de_salles_de_bains: bien.nombre_de_salles_de_bains ?? 0,
                            nombre_de_salles_de_sals: bien.nombre_de_salles_de_sals ?? 0,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<List<Biens_immobilieHive>> _getFavorieBiens() async {
    final box = await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
    return box.values.toList();
  }

  Future<void> _deleteFavorieBiens(int? bienID) async {
    final box = await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
    await box.delete(bienID);
  }
}
