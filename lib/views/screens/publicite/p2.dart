import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/publicite/p2_controller.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/utils/valide_input.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/TextField.dart';

class Informations2 extends StatelessWidget {
  Informations2({Key? key}) : super(key: key);

final List<String> dropdownValues = [
  '27'.tr,
  '39'.tr,
  '40'.tr,
  '41'.tr,
  '68'.tr,
  '69'.tr,
  '70'.tr,
  '71'.tr,
  '72'.tr,
  '73'.tr,
  '74'.tr,
  '75'.tr,
  '76'.tr,
  '77'.tr,
  '78'.tr,
  '79'.tr,
  '80'.tr,
  '81'.tr,
  '82'.tr,
  '83'.tr,
];

final List<String> dropdownLabels = [
  '27'.tr,
  '39'.tr,
  '40'.tr,
  '41'.tr,
  '68'.tr,
  '69'.tr,
  '70'.tr,
  '71'.tr,
  '72'.tr,
  '73'.tr,
  '74'.tr,
  '75'.tr,
  '76'.tr,
  '77'.tr,
  '78'.tr,
  '79'.tr,
  '80'.tr,
  '81'.tr,
  '82'.tr,
  '83'.tr,
];

final List<String> dropdownValues1 = [
  '28'.tr,
  '36'.tr,
  '37'.tr,
  '38'.tr,
  '85'.tr,
  '86'.tr,
  '87'.tr,
  '88'.tr,
  '89'.tr,
];

final List<String> dropdownLabels1 = [
  '28'.tr,
  '36'.tr,
  '37'.tr,
  '38'.tr,
  '85'.tr,
  '86'.tr,
  '87'.tr,
  '88'.tr,
  '89'.tr,
];

final List<String> dropdownValues2 = [
  '42'.tr,
  '43'.tr,
  '44'.tr,
];

final List<String> dropdownLabels2 = [
  '42'.tr,
  '43'.tr,
  '44'.tr,
];

final List<String> dropdownValues3 = [
  '45'.tr,
  '47'.tr,
];

final List<String> dropdownLabels3 = [
  '45'.tr,
  '47'.tr,
];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Informations2ControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '6'.tr,),
      body: GetBuilder<Informations2ControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Form(
              // key: controller.formkey,
              child: ListView(
                children: [
                  DropDown(
                    value: controller.region.toString(),
                    values: dropdownValues,
                    labels: dropdownLabels,
                    onChanged: (value) {
                      controller.region = value!;
                    }, label: '36'.tr,
                  ),
                  const SizedBox(height: 10),
                  DropDown(
                    value: controller.emplacement.toString(),
                    values: dropdownValues1,
                    labels: dropdownLabels1,
                    onChanged: (value) {
                      controller.emplacement = value!;
                    }, label: '39'.tr,
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
                      controller.goToPublicite();
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
