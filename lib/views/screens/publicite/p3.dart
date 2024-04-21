// ignore_for_file: use_super_parameters

import 'dart:io';

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/loginButtom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Informations3 extends StatelessWidget {
  const Informations3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = biensImmobiliersControllerImp();
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<biensImmobiliersControllerImp>(
        init: biensImmobiliersControllerImp(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: () {
                  controller.selectImage();
                },
                child: Container(
                  width: 50,
                  margin:const EdgeInsets.only(left: 20, top: 20,right: 200),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                    border: Border.all(
                       color: AppColor.primaryColor,
                       width: 2.0,
                     ),
                  ),
                  child: const Icon(
                        size: 150,
                        Icons.add_photo_alternate,
                        color: Colors.blue,
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
          );
        },
      ),
    );
  }
}
