import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({Key? key}) : super(key: key);
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80).r,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                SizedBox(width: 20.w),
                Text(
                  'Update your information',
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontFamily: 'RobotoSlab',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // controller: first_nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.h),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    // controller: last_nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.w),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    // controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.w),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  TextFormField(
                    // controller: addressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'address',
                      prefixIcon: Icon(Icons.home),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.w),
                        // borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  IntlPhoneField(
                    // controller: phone_numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'PhoneNumber',
                      prefixIcon: Icon(Icons.apps_outage),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.w),
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
                      // Obx(() => Text('${controller.birth_date}',
                      //     style: TextStyle(
                      //         fontSize: 18.sp, color: Colors.black))),
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
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        Obx(
                          () => Radio(
                            value: 'Female',
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender(value);
                            },
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                            .w,
                    child: SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      side: const BorderSide(
                                          color: Colors.black)))),
                          onPressed: () {
                            //   controller.registerApi(
                            //       first_nameController.text,
                            //       last_nameController.text,
                            //       emailController.text,
                            //       passwordController.text,
                            //       addressController.text,
                            //       phone_numberController.text,
                            //       controller.selectedGender.value,
                            //       controller.birth_date,
                            //       controller.account_type);
                          },
                          child: Text("Update".toUpperCase(),
                              style:
                                  TextStyle(fontSize: 20.sp, letterSpacing: 3))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
