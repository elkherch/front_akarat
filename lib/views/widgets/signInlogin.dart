// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SignIpLogin extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const SignIpLogin({super.key, required this.text1, required this.text2, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,style: Theme.of(context).textTheme.headline6,),
        InkWell(
          onTap: onTap,
          child: Text(text2,style: Theme.of(context).textTheme.headline4,),
        )
      ],
    );
  }
}