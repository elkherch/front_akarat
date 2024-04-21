// ignore_for_file: unused_local_variable

import 'package:akarat/controllers/Login_controller.dart';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/utils/valide_input.dart';
import 'package:akarat/views/widgets/TextFieldForm.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:akarat/views/widgets/loginButtom.dart';
import 'package:akarat/views/widgets/signInlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   biensImmobiliersControllerImp controller = Get.put(biensImmobiliersControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '20'.tr),
      body: GetBuilder<biensImmobiliersControllerImp>(
        init: biensImmobiliersControllerImp(),
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
              key: controller.formkeyAuth,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '20'.tr,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 35),
                  
                  TextFieldLogin(
                    obscureText: false,
                    prefixIcon: Icons.person_outline,
                    myController: controller.nomUser,
                    valid: (val) {
                      return ValideInput(val!, 5, 30, '13'.tr);
                    },
                    isNumber: false,
                    labelText: '13'.tr,
                  ),
                 
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFieldLogin(
                    obscureText: true,
                    prefixIcon: Icons.lock_outlined,
                    myController: controller.password,
                    valid: (val) {
                      return ValideInput(val!, 5, 30, '16'.tr);
                    },
                    isNumber: false,
                    labelText: '16'.tr,
                  ),
                  
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  Loginbuttom(
                    onpressed: () {
                      controller.goTo();
                    },
                    text: '20'.tr,
                  ),
                  const SizedBox(height: 25),
                  SignIpLogin(
                    text1: '21'.tr,
                    text2: '84'.tr,
                    onTap: () {
                      controller.signUp();
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
