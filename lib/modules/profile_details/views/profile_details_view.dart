import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_details_controller.dart';

class ProfileDetailsView extends GetView<ProfileDetailsController> {
  ProfileDetailsView({Key? key}) : super(key: key);
  ProfileDetailsController controller = Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                  colors: [Color(0xFF0087BB), Colors.black]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50).w,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(width: 70.w),
                Text(
                  'your profile',
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 180, right: 18, left: 18).w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(width: 3.w, color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(50).w),
              ),
              width: double.infinity,
              height: 400.h,
              child: Padding(
                padding: REdgeInsets.only(top: 60.0, left: 6),
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      Future.delayed(const Duration(seconds: 2), () {
                        controller.isLoading.value = false;
                      });

                      return Center(child: CircularProgressIndicator());
                    } else
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text('Personal Details',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w900))),
                                TextButton(
                                  child: Text('Edit',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w900)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'First Name : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(controller.user.value!.firstName!,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Last Name : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(controller.user.value!.lastName!,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_month_sharp),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Date of birth :',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(controller.user.value!.age.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/couple-3.png',
                                  scale: 18,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Gender : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(controller.user.value!.gender!,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'phone number : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(controller.user.value!.phoneNumber!,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Email : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(controller.user.value!.email!,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(Icons.home),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text('Address : ',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900)),
                                Text(
                                    controller.user.value!.addressId.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                              ],
                            )
                          ]);
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 130,
              left: 130,
            ).r,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50.w,
              child: Image.asset(
                'assets/images/pp.svg.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
