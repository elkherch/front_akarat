import 'package:akarat/localization/changelangue.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class langue extends GetView<LocalController> {
  const langue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString selectedLanguage = 'fr'.obs;
    LocalController controller = Get.put(LocalController());
    return Scaffold(
      appBar: AppBarCustam(title: '8'.tr),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  buildLanguageTile(
                    title: 'Français',
                    onTap: () {
                      selectedLanguage.value = 'fr';
                      controller.changeLang(selectedLanguage.value);
                    },
                    selected: selectedLanguage.value == 'fr',
                  ),
                  buildLanguageTile(
                    title: 'العربية',
                    onTap: () {
                      selectedLanguage.value = 'ar';
                      controller.changeLang(selectedLanguage.value);
                    },
                    selected: selectedLanguage.value == 'ar',
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildLanguageTile({
    required String title,
    required VoidCallback onTap,
    required bool selected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
