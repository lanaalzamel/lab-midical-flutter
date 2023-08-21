import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  RegisterController controller = Get.put(RegisterController());
  final emailController = TextEditingController();
  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phone_numberController = TextEditingController();
  final birth_dateController = TextEditingController();

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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25).r,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20).r,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          SizedBox(width: 20.w),
                          Text(
                            'Welcome to our App',
                            style: TextStyle(
                                letterSpacing: 3,
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontFamily: 'RobotoSlab'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'please enter your information',
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (GetUtils.isUsername(value!)) {
                              return null;
                            }
                            return "Enter valid name";
                          },
                          controller: first_nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.h),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (GetUtils.isUsername(value!)) {
                              return null;
                            }
                            return "Enter valid name";
                          },
                          controller: last_nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.w),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (GetUtils.isEmail(value!)) {
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
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.w),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.w),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'address',
                            prefixIcon: Icon(Icons.home),
                            prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.w),
                              // borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        IntlPhoneField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phone_numberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'PhoneNumber',
                            prefixIcon: Icon(Icons.apps_outage),
                            prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.w),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Date of Birth:',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Obx(() => Text('${controller.birth_date}',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.black))),
                            IconButton(
                              onPressed: () => controller.chooseDate(),
                              icon: Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Radio(
                                  value: 'Male',
                                  groupValue: controller.selectedGender.value,
                                  onChanged: (value) {
                                    controller.selectedGender(value);
                                  },
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                              ),
                              Obx(
                                () => Radio(
                                  value: 'Female',
                                  groupValue: controller.selectedGender.value,
                                  onChanged: (value) {
                                    controller.selectedGender(value);
                                  },
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10)
                              .w,
                          child: SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            side: const BorderSide(
                                                color: Colors.black)))),
                                onPressed: () {
                                  controller.registerApi(
                                      first_nameController.text,
                                      last_nameController.text,
                                      emailController.text,
                                      passwordController.text,
                                      addressController.text,
                                      phone_numberController.text,
                                      controller.selectedGender.value,
                                      controller.birth_date,
                                      controller.account_type);
                                },
                                child: Text("Next".toUpperCase(),
                                    style: TextStyle(fontSize: 20.sp, letterSpacing: 3))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
