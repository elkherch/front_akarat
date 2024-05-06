// ignore_for_file: unnecessary_null_comparison

import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:akarat/controllers/publiciteAdmin/p1_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/TextField.dart';
import 'package:akarat/views/widgets/drpDrow.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/btnS.dart';
import 'package:akarat/utils/valide_input.dart';

class Informations1Admin extends StatefulWidget {
   Informations1Admin({Key? key}) : super(key: key);

  @override
  State<Informations1Admin> createState() => _Informations1AdminState();
}

class _Informations1AdminState extends State<Informations1Admin> {
  
  List<String> dropdownValues =  [  '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ];
  final List<String> dropdownLabels =  [  '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ];
  ValueNotifier<String> selectedCategorie = ValueNotifier<String>('24'.tr);
  final List<String> dropdownValuesNumber = ['194'.tr,'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  final List<String> dropdownLabelsNumber = ['194'.tr,'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  ValueNotifier<String> selectedChambe = ValueNotifier<String>('194'.tr);

  final List<String> dropdownValuesNumberI = ['195'.tr,'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  final List<String> dropdownLabelsNumberI = ['195'.tr,'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
  ValueNotifier<String> selectedSalon = ValueNotifier<String>('195'.tr);

  // Informations1AdminControllerImp controller = Get.put(Informations1AdminControllerImp());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Informations1ControllerAdminImp());
    
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<Informations1ControllerAdminImp>(
        id: 'bien_p1_admin',
        init: Informations1ControllerAdminImp(),
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
                  DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                   contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.black),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.grey300),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.black),
                   ),
                 ),
                  value: '24'.tr,
                  onChanged: (value) {
                    setState(() {
                    selectedCategorie.value = value!;
                      
                    });
                    
                  },
                  items: dropdownValues.map((ville) {
                    return DropdownMenuItem<String>(
                      value: ville,
                      child: Text(ville),
                    );
                  }).toList(),
                  
                ),
                 
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  Visibility(
  visible: selectedCategorie.value != '24'.tr,
  child: Row(
    children: [
      Expanded(
        flex: 3,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.grey300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.black),
            ),
          ),
          value: '194'.tr,
          onChanged: (value) {
            selectedChambe.value = value!;
          },
          items: dropdownValuesNumber.map((ville) {
            return DropdownMenuItem<String>(
              value: ville,
              child: Text(ville),
            );
          }).toList(),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.grey300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.black),
            ),
          ),
          value: '195'.tr,
          onChanged: (value) {
            selectedSalon.value = value!;
          },
          items: dropdownValuesNumberI.map((ville) {
            return DropdownMenuItem<String>(
              value: ville,
              child: Text(ville),
            );
          }).toList(),
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
                      controller.goToSuivant(selectedCategorie.value,selectedChambe.value, selectedSalon.value);
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
