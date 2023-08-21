import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/register/views/register_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginController controller = Get.put(LoginController());

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
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          fontFamily: 'RobotoSlab',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0.sp,
                          letterSpacing: 3),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(GetUtils.isEmail(value!)){
                        return null;
                      }
                      return "Enter valid email";
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.w),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.lock),
                        onPressed: () {},
                      ),
                      prefixIconColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 40.h,
                      width: double.infinity.w,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      side: const BorderSide(
                                          color: Colors.black)))),
                          onPressed: () {
                            controller.loginApi(
                                emailController.text, passwordController.text);
                          },
                          child: Text("Login".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20.sp, letterSpacing: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'If you don\'t have an account please',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 12.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() =>RegisterView());
                          },
                          child: Text(
                            'click here!',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  TextButton(
                      onPressed: () {Get.to(() =>HomeView());},
                      child: Text(
                        'Continue as guest ',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
