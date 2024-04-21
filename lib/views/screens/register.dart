import 'package:akarat/controllers/register_controller.dart';
import 'package:akarat/utils/valide_input.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/TextFieldForm.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/dropdown.dart';
import 'package:akarat/views/widgets/loginButtom.dart';
import 'package:akarat/views/widgets/signInlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);

   final List<String> dropdownValues2 = ['92'.tr, '93'.tr,'94'.tr];

        final List<String> dropdownLabels2 = ['92'.tr, '93'.tr,'94'.tr];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControlerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '9'.tr),
      body: GetBuilder<SignUpControlerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 10,
              bottom: 20,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: controller.formkeyR,
              child: ListView(
                children: [
                  Text(
                    '11'.tr,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '12'.tr,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 40),
                  const SizedBox(height: 35),
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.person_outline,
                    myController: controller.nomuser,
                    valid: (val) {
                      return ValideInput(val!, 2, 30, '13'.tr);
                    },
                    isNumber: false,
                    labelText: '13'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.person_outline,
                    myController: controller.prenomuser,
                    valid: (val) {
                      return ValideInput(val!, 2, 30, '14'.tr);
                    },
                    isNumber: false,
                    labelText: '14'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.email_outlined,
                    myController: controller.emailuser,
                    valid: (val) {
                      return ValideInput(val!, 2, 30, '15'.tr);
                    },
                    isNumber: false,
                    labelText: '15'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.phone_outlined,
                    myController: controller.numeroteluser,
                    valid: (val) {
                      return ValideInput(val!, 2, 12, '17'.tr);
                    },
                    isNumber: true,
                    labelText: '17'.tr,
                  ),
                  
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.facebook,
                    myController: controller.fbuser,
                    valid: (val) {
                      return ValideInput(val!, 2, 12, '17'.tr);
                    },
                    isNumber: false,
                    labelText: '18'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: true,
                    prefixIcon: Icons.lock_outlined,
                    myController: controller.passworduser,
                    valid: (val) {
                      return ValideInput(val!, 2, 30, '16'.tr);
                    },
                    isNumber: false,
                    labelText: '16'.tr,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  // Dropdown pour le type de compte
                  DropDown(
                    value: controller.selectedAccountTypeI.toString(),
                    values: dropdownValues2,
                    labels: dropdownLabels2,
                    onChanged: (value) {
                      controller.selectedAccountTypeI = value!;
                    }, label: '', 
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  Loginbuttom(
                    onpressed: () {
                      controller.signUp();
                    },
                    text: '9'.tr,
                  ),
                  const SizedBox(height: 25),
                  SignIpLogin(
                    text1: '10'.tr,
                    text2: '20'.tr,
                    onTap: () {
                      controller.goTologin();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
