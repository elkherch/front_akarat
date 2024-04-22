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

    return Container(
      child:GetBuilder<biensImmobiliersControllerImp>(
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
      return Card(
        child: Column(children: [
          Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:12.0,top: 10),
                              child: Text(
                                    "${bien.type_de_bien}",
                                    style: const TextStyle(color: AppColor.black, fontSize: 16),
                              ),
                            ),
                            IconButton(onPressed: (){_deleteFavorieBiens(bien.bienID);}, icon: Icon(Icons.favorite))
                          ],
                        ),
        ],),
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
        )
    );
      
    
  }

  Future<List<Biens_immobilieHive>> _getFavorieBiens() async {
    final box = await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
    return box.values.toList();
  }
  Future<void> _deleteFavorieBiens(int? bienID) async {
  final box = await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
  print('Boîte ouverte: $box'); // Afficher la boîte ouverte
  print('Contenu de la boîte avant la suppression: ${box.values.toList()}'); // Afficher le contenu de la boîte avant la suppression
  await box.delete(bienID);
  print('Contenu de la boîte après la suppression: ${box.values.toList()}'); // Afficher le contenu de la boîte après la suppression
}


}