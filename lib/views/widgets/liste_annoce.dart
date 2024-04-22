// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps

import 'package:akarat/controllers/trip_bien_controller.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripAnnonce extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String prix;
  final String surface;
  final String lien;
  final int idbien;
  final int nombre_de_salles_de_bains;
  final int nombre_de_salles_de_sals;
  
  const TripAnnonce({
    Key? key,
    required this.imageUrl,
    required this.title, 
    required this.surface, 
    required this.lien, 
    required this.prix,
    required this.idbien, required this.nombre_de_salles_de_bains, required this.nombre_de_salles_de_sals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TripBienControllerImp controller = Get.put(TripBienControllerImp());
    
    return GetBuilder<TripBienControllerImp>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.goToDetails(idbien);
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
                    if (imageUrl != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          imageUrl!,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      Container( // Placeholder widget if imageUrl is null
                        height: 180,
                        color: Colors.grey, // You can set any color you want here
                        child: const Center(
                          child:  Text('No Image'), // Placeholder text
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
