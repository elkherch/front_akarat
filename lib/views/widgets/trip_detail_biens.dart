// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, unnecessary_import, sort_child_properties_last

import 'package:akarat/controllers/details_biens_controller.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/anothesImages.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TripDetailsBiens extends StatelessWidget {
  final String title;
  const TripDetailsBiens({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DetailsBiensControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: title),
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
                       if (bien.images != null)
                           AnotherImages(allImages: bien.images)
                        else
                            Container(
                              height: 180,
                              color: Colors.grey,
                              child: const Center(
                                child:  Icon(Icons.image, size: 40, color: AppColor.grey300,),
                              ),
                            ),
                        ],
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
              
                            const SizedBox(height: 10),
                            Row(children: [ Text("${bien.type_de_bien}", style: Theme.of(context).textTheme.bodyText2,),],),
                            Row(children: [Text("${bien.prix}", style:  Theme.of(context).textTheme.bodyText2,)],),
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
                                 Text('28'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.emplacement}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('29'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.adresse}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('30'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.surface}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('103'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.nombre_de_salles_de_sals}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                 Text('104'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                                const Spacer(),
                                Text("${bien.nombre_de_salles_de_bains}", style:  Theme.of(context).textTheme.bodyText2,)
                              ],
                            ),
                            const SizedBox(height: 10),
                           
                            Row(
                                 children: [
                                   Text(
                                     '102'.tr,
                                     style: Theme.of(context).textTheme.bodyText2,
                                   ),
                                 ],
                               ),
                            // const Spacer(),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8, // Utilisez une largeur spécifique (60% de la largeur de l'écran ici)
                                  child: Text(
                                    "${bien.description} ",
                                    style: Theme.of(context).textTheme.bodyText2,
                                    overflow: TextOverflow.fade, // Gérer le débordement du texte avec un fondu
                                  ),
                                ),
                              ],
                            ),

                            
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
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
                            Row(
                              children: [
                                Text('184'.tr, style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 120,
                              height: 120,
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
                            Row(
                              children: [
                                Text("${bien.username} ${bien.first_name}", style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text("${bien.numero}", style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text("${bien.email}", style:  Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            const SizedBox(height: 30),
                             Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             TextButton(
                               onPressed: () {
                                 launchCall("${bien.numero}");
                               },
                               child: Row(
                                children: [
                                   const Icon(Icons.phone, color: AppColor.backgroundcolor,),
                                   const SizedBox(width: 8), 
                                   Text(
                                     '178'.tr, // Texte du bouton SMS
                                     style: const TextStyle(
                                       color: AppColor.backgroundcolor, // Couleur du texte
                                       fontSize: 16, // Taille du texte
                                     ),
                                   ),
                                 ],
                               ),
                               style: ButtonStyle(
                                 backgroundColor: MaterialStateProperty.all(AppColor.whiteColor), // Couleur de fond du bouton
                               ),
                             ),
                           ],
                         ),
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
      // floatingActionButton: 



    );

  }
launchCall(String phoneNumber) async {
  String url = "tel:$phoneNumber";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible de lancer l\'appel avec le numéro $phoneNumber';
  }
}

}
