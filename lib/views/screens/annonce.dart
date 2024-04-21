import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Annonce extends StatefulWidget {
  const Annonce({super.key});

  @override
  State<Annonce> createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustam(title: '7'.tr),
      body:const  Center(
        child:Text(
          "Cette page est en cours de développement.",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
    );
  }
}