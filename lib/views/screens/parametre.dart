import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/parametre_controller.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Parametre extends StatelessWidget {
  const Parametre({super.key});

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = Get.put(biensImmobiliersControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '48'.tr,),
      body: GetBuilder<biensImmobiliersControllerImp>(
        id: 'bien_parametre',
        init: controller,
        builder: (controller){
        if (controller.iduser == 0) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               const SizedBox(height: 100),

                Text(
                  '90'.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 400),
                AnnonceBtn(onpressed: (){controller.signUp();}, text: '84'.tr,)
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
                  const Divider(),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
