import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/publicite/p2_controller.dart';
import 'package:akarat/controllers/publiciteAdmin/p2_admin_controller.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/utils/valide_input.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/TextField.dart';

class Informations2Admin extends StatefulWidget {
  Informations2Admin({Key? key}) : super(key: key);

  @override
  State<Informations2Admin> createState() => _Informations2State();
}

class _Informations2State extends State<Informations2Admin> {
  List<String> villes = ['193'.tr,'39'.tr,'40'.tr, '41'.tr, '68'.tr,'69'.tr,'70'.tr,'71'.tr,'72'.tr,'73'.tr,'75'.tr,'76'.tr,'77'.tr];

  Map<String, List<String>> quartiers = {
    '193'.tr: [''],
    '39'.tr: ['182'.tr, '183'.tr],
    '40'.tr: ['169'.tr, '170'.tr, '171'.tr,'172'.tr,'173'.tr,'174'.tr,'175'.tr,'176'.tr,'177'.tr],
    '41'.tr: ['124'.tr, '125'.tr, '126'.tr, '127'.tr, '128'.tr, '129'.tr,],
    '68'.tr: ['130'.tr, '131'.tr,'132'.tr,'133'.tr],
    '69'.tr: ['134'.tr, '135'.tr,'136'.tr,'137'.tr,'138'.tr],
    '70'.tr: ['139'.tr, '140'.tr, '141'.tr,'142'.tr],
    '71'.tr: ['143'.tr, '144'.tr, '145'.tr,'146'.tr,'147'.tr],
    '72'.tr: ['148'.tr, '149'.tr, '150'.tr,'151'.tr,'152'.tr,'153'.tr],
    '73'.tr: ['154'.tr, '155'.tr, '156'.tr,'157'.tr],
    '74'.tr: ['159'.tr, '160'.tr, '161'.tr],
    '75'.tr: ['162'.tr, '163'.tr],
    '76'.tr: ['164'.tr, '165'.tr,'166'.tr],
    '77'.tr: ['167'.tr, '168'.tr],

  };

  ValueNotifier<String> selectedVille = ValueNotifier<String>('193'.tr);

  ValueNotifier<String?> selectedQuartier = ValueNotifier<String?>(null);

final List<String> dropdownValues2 = [
  '42'.tr,
  '44'.tr,
];


final List<String> dropdownLabels2 = [
  '42'.tr,
  '44'.tr,
];

final List<String> dropdownValues3 = [
  '47'.tr,
];

final List<String> dropdownLabels3 = [
  '47'.tr,
];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Informations2ControllerAdminImp());
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<Informations2ControllerAdminImp>(
        init:Informations2ControllerAdminImp() ,
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Form(
              // key: controller.formkey,
              child: ListView(
                children: [
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
                  value: '193'.tr,
                  onChanged: (value) {
                    selectedVille.value = value!;
                    if (quartiers[value]!.isNotEmpty) {
                      selectedQuartier.value = quartiers[value]!.first;
                    } else {
                      selectedQuartier.value = null;
                    }
                  },
                  items: villes.map((ville) {
                    return DropdownMenuItem<String>(
                      value: ville,
                      child: Text(ville),
                    );
                  }).toList(),
                  
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<String>(
                  valueListenable: selectedVille,
                  builder: (context, ville, _) {
                    return DropdownButtonFormField<String>(
                      value: selectedQuartier.value,
                      onChanged: (value) {
                        selectedQuartier.value = value;
                      },
                      items: quartiers[ville]!.map((quartier) {
                        return DropdownMenuItem<String>(
                          value: quartier,
                          child: Text(quartier),
                        );
                      }).toList(),
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
                           labelText: '158'.tr
                         ),
                    );
                  },
                ),
                  
                  const SizedBox(height: 10),
                  TextInput(
                    isNumber: false,
                    obscureText: false,
                    myController: controller.adresse,
                    valid: (val) {
                      return ValideInput(val!, 5, 30, '29'.tr);
                    },
                    labelText: '29'.tr,
                  ),
                  
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child:
                        TextInput(
                          isNumber: true,
                    obscureText: false,
                    myController: controller.surface,
                    valid: (val) {
                      return ValideInput(val!, 5, 12, '30'.tr);
                    },
                    labelText: '30'.tr,
                  ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: DropDown(
                    value: controller.selectUnite.toString(),
                    values: dropdownValues3,
                    labels: dropdownLabels3,
                    onChanged: (value) {
                      controller.selectUnite = value!;
                    }, label: '45'.tr,
                  ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                   Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child:
                        TextInput(
                          isNumber: true,
                    obscureText: false,
                    myController: controller.prix,
                    valid: (val) {
                      return ValideInput(val!, 5, 12, '31'.tr);
                    },
                    labelText: '31'.tr,
                  ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: DropDown(
                    value: controller.selectDevise.toString(),
                    values: dropdownValues2,
                    labels: dropdownLabels2,
                    onChanged: (value) {
                      controller.selectDevise = value!;
                    }, label: '43'.tr,
                  ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                 Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child:AnnonceBtn(
                    onpressed: () {
                      controller.goToPublicite1();
                    },
                    text: '22'.tr,
                  ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child:AnnonceBtn(
                    onpressed: () {
                      controller.goToPublicite(selectedVille.value, selectedQuartier.value!);
                    },
                    text: '23'.tr,
                  ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
      
        },
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}