// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final List<DrawerItem> drawerItems;

  const AppDrawer({required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 360,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Center(
                    child: Icon(Icons.person, size: 100, color: AppColor.whiteColor),
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundcolor,
                  ),
                ),
                for (DrawerItem item in drawerItems)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(item.title),
                      leading: Icon(item.icon, color: AppColor.backgroundcolor),
                      onTap: () {
                        Navigator.pop(context);
                        item.onTap();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  final Function onTap;

  DrawerItem({required this.title, required this.icon, required this.onTap});
}
