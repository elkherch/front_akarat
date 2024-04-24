import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onDrawerPressed;
  final Function()? onSearchPressed;
  final bool isFrench;

  CustomAppBar({
    required this.title,
    required this.onDrawerPressed,
    required this.onSearchPressed,
    required this.isFrench,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      
      preferredSize: const Size.fromHeight(kToolbarHeight + 20), // Ajustez la hauteur ici
      child: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        leading: isFrench
            ? Column(
              children: [
                IconButton(
                    icon: const Icon(Icons.search, color: AppColor.whiteColor,),
                    onPressed: onSearchPressed,
                  ),
              ],
            )
            : IconButton(
                icon: const Icon(Icons.menu, color: AppColor.whiteColor,),
                onPressed: onDrawerPressed,
              ),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logoapp.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
        actions: <Widget>[
          
          isFrench
              ? IconButton(
                  icon: const Icon(Icons.menu, color: AppColor.whiteColor,),
                  onPressed: onDrawerPressed,
                )
              : IconButton(
                  icon: const Icon(Icons.search, color: AppColor.whiteColor,),
                  onPressed: onSearchPressed,
                ),
        ],
        bottom: const PreferredSize(
          
          preferredSize: Size.fromHeight(20),
          child: SizedBox(height: 2),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
