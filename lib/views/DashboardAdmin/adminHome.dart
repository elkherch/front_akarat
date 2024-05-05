// Fichier admin_home_screen.dart

// ignore_for_file: use_key_in_widget_constructors

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/widgets/bien_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<biensImmobiliersControllerImp>(
        id: "screen_home",
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
      return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.biens.length,
                itemBuilder: (context, index) {
                  final bien = controller.biens[index];
                  String? imageUrl = bien.images?.isNotEmpty ?? false ? bien.images![0] : null;
                  if (imageUrl != null && !imageUrl.startsWith("http://") && !imageUrl.startsWith("https://")) {
                    imageUrl = "http://khdev.pythonanywhere.com" + imageUrl;
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
                    nombre_de_salles_de_bains: bien.nombre_de_salles_de_bains ?? 0,
                    nombre_de_salles_de_sals: bien.nombre_de_salles_de_sals ?? 0,
                  );
                },
              ),
            ),
          ],
        ),
        Obx(() {
          return controller.isLoading.value
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              :const SizedBox.shrink();
        }),
      ],
    );
   }
    );
}
}