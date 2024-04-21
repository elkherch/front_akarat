// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onDrawerPressed;
  final Function()? onSearchPressed;
  final bool isFrench;

  CustomAppBar( {
    required this.title,
    required this.onDrawerPressed,
    required this.onSearchPressed,
    required this.isFrench,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundcolor,
      centerTitle: true,
      leading: isFrench
          ? IconButton(
              icon: const Icon(Icons.search,color: AppColor.whiteColor,),
              onPressed: onSearchPressed,
            )
          : IconButton(
              icon: const Icon(Icons.menu, color: AppColor.whiteColor,),
              onPressed: onDrawerPressed,
            ),
          title: Text(title, style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor
          )),
        actions: <Widget>[
        isFrench
            ? IconButton(
                icon: const Icon(Icons.menu,color: AppColor.whiteColor,),
                onPressed: onDrawerPressed,
              )
            : IconButton(
                icon: const Icon(Icons.search, color: AppColor.whiteColor,),
                onPressed: onSearchPressed,
              ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
