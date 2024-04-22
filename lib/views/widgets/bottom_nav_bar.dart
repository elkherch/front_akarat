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
              icon: const ImageIcon(AssetImage('assets/icons/house.png'),size: 20,),
              label: '2'.tr,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/icons/heart.png'),size: 20,),
              label: '3'.tr,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/icons/placeholder.png'),size: 20,),
              label: '4'.tr,
            ),
        ],
      ),
    );
    
  }
}
