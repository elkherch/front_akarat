import 'package:akarat/controllers/parametre_controller.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Parametre extends StatelessWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParametreControllerImp controller = Get.put(ParametreControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '48'.tr,),
      body: GetBuilder<ParametreControllerImp>(
        id: 'bien_parametre',
        builder: (controller){
        if (controller.iduser == 0) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '90'.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 90),
                AnnonceBtn(onpressed: (){controller.nouvelCompte();}, text: '84'.tr,)
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.dataParametre.length,
            itemBuilder: (context, index) {
              final data1 = controller.dataParametre[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 100),
                  Text("Nom: ${data1['username'] ?? 'Elkherchy'}"),
                  Text("Prénom: ${data1['first_name'] ?? 'Elkherchy'}"),
                  const Divider(), // Ajout de la ligne de séparation en bas
                ],
              );
            },
          );
        }
      }),
    );
  }
}
