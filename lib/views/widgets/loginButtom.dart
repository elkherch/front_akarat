// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class Loginbuttom extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  const Loginbuttom({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
        onPressed:onpressed,
      color: AppColor.backgroundcolor,
      child: Text(text, style: Theme.of(context).textTheme.headline2,),
      );
  }
}