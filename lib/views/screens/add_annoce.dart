
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAnnonce extends StatefulWidget {
  const AddAnnonce({super.key});

  @override
  State<AddAnnonce> createState() => _AddAnnonceState();
}

class _AddAnnonceState extends State<AddAnnonce> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarCustam(title: '48'.tr,),
      body:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '90'.tr,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 90),

                      
              
                    ],
                  ), 
    );
     
  }
}