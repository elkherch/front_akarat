// ignore_for_file: deprecated_member_use

import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  const Mybutton({super.key, required this.text, this.onpressed, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
