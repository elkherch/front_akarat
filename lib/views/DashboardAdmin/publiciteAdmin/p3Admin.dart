// ignore_for_file: use_super_parameters

import 'dart:io';

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/loginButtom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Informations3Admin extends StatelessWidget {
  const Informations3Admin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = biensImmobiliersControllerImp();
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<biensImmobiliersControllerImp>(
        init: controller,
        builder: (controller) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('190'.tr , 
                       style:const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.backgroundcolor
                            )
                       ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectImage();
                    },
                    child: Container(
                      width: 50,
                      
                      margin:const EdgeInsets.only(left: 20, top: 20,right: 290),
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200],
                        border: Border.all(
                           color: AppColor.backgroundcolor,
                           width: 2.0,
                         ),
                      ),
                      child: const Icon(
                            size: 80,
                            Icons.add_photo_alternate,
                            color: AppColor.backgroundcolor,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: controller.imageXFileList!.length,
                        itemBuilder: (BuildContext context, index) {
                          return Image.file(File(controller.imageXFileList[index].path), fit: BoxFit.cover,);
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Loginbuttom(
                      onpressed: () {
                        controller.goToCreer();
                      },
                      text: 'Créer',
                    ),
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
               Obx(() {
                return controller.isLoadingCreerBien.value
                ? Container(
                    color: Colors.black.withOpacity(0.5), // Opacité de l'arrière-plan
                    child:const Center(
                      child:CircularProgressIndicator(
                           color:AppColor.backgroundcolor, 
                           strokeWidth: 2,
                      ),
                    ),
                  )
                : SizedBox.shrink();
          }),
            ],
          );
        },
      ),
    );
  }
}
