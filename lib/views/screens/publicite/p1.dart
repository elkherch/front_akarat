import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/TextField.dart';
import 'package:akarat/views/widgets/drpDrow.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/btnS.dart';
import 'package:akarat/utils/valide_input.dart';

class Informations1 extends StatefulWidget {
  const Informations1({Key? key}) : super(key: key);

  @override
  _Informations1State createState() => _Informations1State();
}

class _Informations1State extends State<Informations1> {
  
  final List<String> dropdownValues =  [  '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ];
  final List<String> dropdownLabels =  [  '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ];

  final List<String> dropdownValuesNumber = ['صالة','1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  final List<String> dropdownLabelsNumber = ['صالة','1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];

  final List<String> dropdownValuesNumberI = ['غرفة','1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  final List<String> dropdownLabelsNumberI = ['غرفة','1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];

  @override
  Widget build(BuildContext context) {
    Informations1ControllerImp controller = Get.put(Informations1ControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<Informations1ControllerImp>(
        id: 'bien_p1',
        init: controller,
        builder: (controller) {
          if (controller.iduser == 0) {
            return Container(
            margin:const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               const SizedBox(height: 100),

                Text(
                  '90'.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 350),
                AnnonceBtn(onpressed: (){controller.creerCompte();}, text: '84'.tr,)
              ],
            ),
          );
          }else{
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 1),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  const SizedBox(height: 35),
                  DropDownAjoute(
                    value: controller.selectedCategory.isNotEmpty ? controller.selectedCategory : dropdownValues.first,
                    values: dropdownValues,
                    labels: dropdownLabels,
                    onChanged: (value) {
                      setState(() {
                        controller.selectedCategory = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  Visibility(
                    visible: controller.selectedCategory.isNotEmpty, // Afficher si une catégorie est sélectionnée
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: DropDownAjoute(
                            value: controller.selectedNbBien,
                            values: dropdownValuesNumber,
                            labels: dropdownLabelsNumber,
                            onChanged: (value) {
                              setState(() {
                                controller.selectedNbBien = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: DropDownAjoute(
                            value: controller.selectedNbBien1,
                            values: dropdownValuesNumberI,
                            labels: dropdownLabelsNumberI,
                            onChanged: (value) {
                              setState(() {
                                controller.selectedNbBien1 = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextInput(
                    isNumber: false,
                    obscureText: false,
                    myController: controller.typeAnController,
                    valid: (val) {
                      return ValideInput(val!, 5, 30, '25'.tr);
                    },
                    labelText: '25'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: controller.descrController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '26'.tr,
                      contentPadding: const EdgeInsets.fromLTRB(10, 90, 80, 15),
                      border: buildBorder(),
                      enabledBorder: buildBorder(),
                      focusedBorder: buildBorder(),
                      disabledBorder: buildBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  BtnSuiv(
                    onpressed: () {
                      controller.goToSuivant();
                    },
                    text: '23'.tr,
                  ),
                ],
              ),
            ),
          );
          
        }
        }),
    );
  }
  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}
