// ignore_for_file: deprecated_member_use

import 'package:akarat/controllers/details_biens_controller.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TripDetailsBiens extends StatelessWidget {
  const TripDetailsBiens({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DetailsBiensControllerImp());

    return Scaffold(
      appBar: AppBarCustam(title: '100'.tr),
      body: Obx(() {
        final controller = Get.find<DetailsBiensControllerImp>();
        return SingleChildScrollView(
          child: Column(
            children: controller.dataDetais.map((bien) => SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                elevation: 2,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(1),
                            topRight: Radius.circular(1),
                          ),
                          child: Image.network(
                            bien.images != null ? "http://khdev.pythonanywhere.com/${bien.images![0]}" : "default value",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
              
                            const SizedBox(height: 10),
                            Row(children: [ Text("${bien.type_de_bien}", style: Theme.of(context).textTheme.bodyText2,),],),
                            Row(children: [Text("${bien.prix} MRU", style:  Theme.of(context).textTheme.bodyText2,)],),
                            const SizedBox(height: 10),
                  
                            const Divider(), 
                            
                            Row(children: [ Text('100'.tr, style: Theme.of(context).textTheme.bodyText2,),],),
                            const SizedBox(height: 10),
                           Row(
                           children: [
                             Text(
                               '96'.tr,
                               style: Theme.of(context).textTheme.bodyText2,
                             ),
                             const Spacer(), // Pour occuper l'espace restant
                             Text(
                               "${bien.type_de_bien}",
                               style: Theme.of(context).textTheme.bodyText2,
                             ),
                           ],
                         ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('98'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.surface}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            
                            const SizedBox(height: 10),
                           
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('102'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                               const Spacer(),
                                Text("${bien.description}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                     Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                       ),
                elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
              
                            Container(
                              width: 120, // ajustez la taille du conteneur en fonction de vos besoins
                              height: 120, // ajustez la taille du conteneur en fonction de vos besoins
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.backgroundcolor, // couleur de fond du cercle
                              ),
                              child:const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 60, // taille de l'icône
                                  color: AppColor.whiteColor, // couleur de l'icône
                                ),
                              ),
                            ),
          
                            const Divider(),
                            const SizedBox(height: 10),
                            
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text("${bien.email}", style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            Row(
                              children: [
                                Text("${bien.username} ${bien.first_name}", style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            const SizedBox(height: 10),
              
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            )).toList(),
            
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.whiteColor,
          onPressed: () {
          },
          tooltip: 'WhatsApp', // Info-bulle affichée lorsque vous survolez le bouton
          child: const Icon(
            Icons.whatshot, // Icône WhatsApp
            color: AppColor.backgroundcolor, // Couleur de l'icône
          ),
        )
    );

  }
}
