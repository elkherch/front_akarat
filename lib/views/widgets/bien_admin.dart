// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/anothesImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiensAdmin extends StatelessWidget {
  final void Function()? onpressed;

  final List<dynamic>? allImages;

  final String title;
  final String prix;
  final String surface;
  final String lien;
  final int idbien;
  final int nombre_de_salles_de_bains;
  final int nombre_de_salles_de_sals;
  
   BiensAdmin({
    Key? key,
    required this.title, 
    required this.surface, 
    required this.lien, 
    required this.prix,
    required this.idbien,
     required this.nombre_de_salles_de_bains, required this.nombre_de_salles_de_sals,required this.onpressed, this.allImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = Get.put(biensImmobiliersControllerImp());
    
    
    return GetBuilder<biensImmobiliersControllerImp>(
      id: "bien_adminn",
      init: controller,
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.goToDetails(idbien , title);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 2,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                      children: [
                       if ( allImages != null)
                           AnotherImages(allImages: allImages)
                        else
                            Container(
                              height: 180,
                              color: Colors.grey,
                              child: const Center(
                                child:  Icon(Icons.image, size: 40, color: AppColor.black,),
                              ),
                            ),
                        ],
                    ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:12.0,top: 10),
                            child: Text(
                                  title,
                                  style: const TextStyle(color: AppColor.black, fontSize: 16),
                            ),
                          ),
                        const  Spacer(),
                        IconButton(
                          onPressed: onpressed,
                           icon: const Icon(
                             Icons.delete,
                             color: Colors.red,
                            )
                           )
                        ],
                      ),
                      Padding(
                        padding:const  EdgeInsets.only(left:12.0),
                        child: Row(
                              children: [
                                const Icon(Icons.location_on, color: AppColor.backgroundcolor,size: 16,),
                               const  SizedBox(width: 6),
                                Text(
                                  lien,
                                  style: const TextStyle(color: AppColor.black, fontSize: 16),
                                ),
                              ],
                            ),
                      ),
                      // const SizedBox(height: 10,),
                     Row(
  children: [
    const SizedBox(width: 15),
    Row(
      children: [
        const Icon(Icons.aspect_ratio, color: AppColor.backgroundcolor,size: 15,),
        const SizedBox(width: 6),
        Text(
          surface ,
          style: const TextStyle(color: AppColor.black, fontSize: 16),
        ),
      ],
    ),
    const SizedBox(width: 10),
    Row(
      children: [
        const Icon(Icons.bathtub, color: AppColor.backgroundcolor,size: 15,),
        const SizedBox(width: 6),
        Text(
          "$nombre_de_salles_de_bains",
          style: const TextStyle(color: AppColor.black, fontSize: 16),
        ),
      ],
    ),
    const SizedBox(width: 10),
    Row(
      children: [
        const Icon(Icons.weekend, color: AppColor.backgroundcolor,size: 15,),
        const SizedBox(width: 6),
        Text(
          "$nombre_de_salles_de_sals",
          style: const TextStyle(color: AppColor.black, fontSize: 16),
        ),
      ],
    ),
  ],
),
       const  SizedBox(height: 10,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
