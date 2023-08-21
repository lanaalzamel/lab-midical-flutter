import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
   SplashView({Key? key}) : super(key: key);
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(color: Colors.black12)))),
        ],
      )
    );
  }
}
