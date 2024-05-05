import 'package:akarat/views/layouts/changelangue.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class langue extends GetView<LocalController> {
  const langue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString selectedLanguage = 'fr'.obs;

    return Scaffold(
      appBar: AppBarCustam(title: '8'.tr),
      body: Obx(() {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 235, 235),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title:const Text('Français',
                        style: TextStyle(fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold)),
                        onTap: () {
                          selectedLanguage.value = 'fr';
                          controller.changeLang(selectedLanguage.value);
                        },
                        trailing: selectedLanguage.value == 'fr' ? const Icon(Icons.check_circle_outlined, color: Colors.green) :const Icon(Icons.check_circle_outlined, color: Colors.black),
                        selectedTileColor: selectedLanguage.value == 'fr' ? Colors.grey.withOpacity(0.5) : null,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 235, 235),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title:const  Text('العربية',
                        style: TextStyle(fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold)),
                        onTap: () {
                          selectedLanguage.value = 'ar';
                          controller.changeLang(selectedLanguage.value);
                        },
                        trailing: selectedLanguage.value == 'ar' ?const Icon(Icons.check_circle_outlined, color: Colors.green) : const Icon(Icons.check_circle_outlined, color: Colors.black),
                        selectedTileColor: selectedLanguage.value == 'ar' ? Colors.grey.withOpacity(0.5) : null,
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          );
        }
      ),
    );
  }
}
