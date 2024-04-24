
import 'package:akarat/utils/statusRequest.dart';
import 'package:akarat/views/themes/imagesAsset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget,});
  @override
  Widget build(BuildContext context) {
    return 
    statusRequest == StatusRequest.loading ?
     Center(child: Lottie.asset(ImagesAssert.loading)) :
    statusRequest == StatusRequest.offlinefailure ?
     Center(child: Lottie.asset(ImagesAssert.affline)) :
    statusRequest == StatusRequest.serveurfailure?

     Center(child: Lottie.asset(ImagesAssert.server)) :
    statusRequest == StatusRequest.none ?
     Center(child: Lottie.asset(ImagesAssert.nodata)) :

     widget;
  }
}