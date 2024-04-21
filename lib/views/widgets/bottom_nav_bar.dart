// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavBar({super.key, 
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
     return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: currentIndex == 0 ? AppColor.primaryColor : AppColor.whiteColor,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColor.backgroundcolor,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.whiteColor,
        items:  [
          BottomNavigationBarItem(
            icon:const Icon(Icons.home),
            label: '2'.tr,
          ),
          
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: '3'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.location_on),
            label: '4'.tr,
          ),
        ],
      ),
    );
    
  }
}
