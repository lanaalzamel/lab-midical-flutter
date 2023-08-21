import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lab_app/app/modules/login/views/login_view.dart';
import 'package:lab_app/app/modules/register/views/register_view.dart';

import '../controllers/on_boarding_screen_controller.dart';

class OnBoardingScreenView extends GetView<OnBoardingScreenController> {
  const OnBoardingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(color: Colors.black12)))),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/on.png',
                      scale: 1.5,
                    )),
              ),
              Text('Welcome To AlphaLab',style: TextStyle(fontSize: 25,letterSpacing:2,fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical:100),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      side: const BorderSide(color: Colors.black)))),
                          onPressed: () {Get.to(() => LoginView());},
                          child: Text("Login".toUpperCase(),
                              style: TextStyle(fontSize: 20.sp, letterSpacing: 2))),
                    ),
                    SizedBox(width: 50.w),
                    SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  side: const BorderSide(color: Colors.black)))),
                          onPressed: () {Get.to(() => RegisterView()
                          );},
                          child: Text("Sign up".toUpperCase(),
                              style: TextStyle(fontSize: 20.sp, letterSpacing: 2))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
