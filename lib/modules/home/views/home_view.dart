import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/medical_report/views/medical_report_view.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Welcome ',
            style:
                TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 3),
          ),
          actions: [
            IconButton(
                tooltip: 'profile',
                onPressed: () {
                  Get.to(() => ProfileView());
                },
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/pp.svg.png',
                  ),
                  color: Colors.grey,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8).r,
                child: Row(
                  children: [
                    Icon(Icons.lightbulb),
                    SizedBox(width: 4.w),
                    Text('insights for you',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10).w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => MedicalReportView());
                  },
                  child: CarouselSlider(
                    items: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                'assets/images/biomarker.png',
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Biomarkers in cancer-associated thrombosis : insights from Prof Anna Falanga and Cinzia Giaccherini',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 220.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('Top Rated Labs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('view all',
                          style:
                              TextStyle(color: Colors.grey, fontSize: 15.sp)))
                ],
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    Future.delayed(const Duration(seconds: 2), () {
                      controller.isLoading.value = false;
                    });

                    return Center(child: CircularProgressIndicator());
                  } else
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.toplabList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.grey[300],
                          child: Container(
                            height: 120.h,
                            child: Padding(
                              padding: const EdgeInsets.all(10).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        controller.toplabList[index].image),
                                    radius: 45,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.toplabList[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text('Time : From '),
                                            Text(controller
                                                .toplabList[index].openHour),
                                            Text(' to '),
                                            Text(controller
                                                .toplabList[index].closeHour),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text('Address :  '),
                                            Text(controller
                                                .toplabList[index].addressId
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                }),
              ),
            ],
          ),
        ));
  }
}
