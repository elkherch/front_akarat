import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/TextField.dart';
import 'package:akarat/views/widgets/drpDrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/btnS.dart';
import 'package:akarat/utils/valide_input.dart';

class Informations1 extends StatelessWidget {
   Informations1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Informations1ControllerImp controller = Get.put(Informations1ControllerImp());
    return Scaffold(
  appBar: AppBarCustam(title: '6'.tr,),
  body: GetBuilder<Informations1ControllerImp>(
    id: 'bien_ajoute',
    builder: (controller) {
        return SingleChildScrollView(
          child: controller.iduser == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      '90'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 90),
                  AnnonceBtn(onpressed: (){controller.creerCompte();}, text: '84'.tr,)
                ],
              )
            :Container(
              padding: const EdgeInsets.only(
                // left: 2,
                // right: 2,
                top: 1,
                // bottom: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: controller.formkeyS,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    const SizedBox(height: 35),
                    // Dropdown pour le type de compte
                    DropDownAjoute(
                      value: controller.selectedAccountE.value,
                      values: controller.dropdownValues,
                      labels: controller.dropdownLabels,
                      onChanged: (value) {
                        controller.selectedAccountE.value = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                     Visibility(
                       visible: controller.selectedAccountE.value != '24', 
                       child: Row(
                         children: [
                           Expanded(
                             flex: 3,
                             child: DropDownAjoute(
                               value: controller.nbBien.toString(),
                               values: controller.dropdownValuesNumber,
                               labels: controller.dropdownLabelsNumber,
                               onChanged: (value) {
                                 controller.nbBien = value!;
                               },
                             ),
                           ),
                           const SizedBox(width: 10),
                           Expanded(
                             flex: 3,
                             child: DropDownAjoute(
                               value: controller.nbBien1.toString(),
                               values: controller.dropdownValuesNumberI,
                               labels: controller.dropdownLabelsNumberI,
                               onChanged: (value) {
                                 controller.nbBien1 = value!;
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
                      myController: controller.type_an,
                      valid: (val) {
                        return ValideInput(val!, 5, 30, '25'.tr);
                      },
                      labelText: '25'.tr,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.descr,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: '26'.tr,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 90, 80, 15),
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
            )
            
        );
      })
    
);

  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}
