import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/results/views/results_view.dart';

import '../../../views/views/constants_view.dart';
import '../controllers/past_appointments_details_controller.dart';

List<String> Biomarkers = <String>[
  'CBC',
  'Vitamins',
  'Hormones',
  'Vitamins'
];

class PastAppointmentsDetailsView
    extends GetView<PastAppointmentsDetailsController> {
  PastAppointmentsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: AppBarModel,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50).w,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 70, bottom: 10).w,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/lablab.png'),
                  radius: 50,
                ),
              ),
              SizedBox(height: 10.0),
              Text(appointment1.labortary_name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 20)
                          .w,
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(width: 3.w, color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(50).w),
                    ),
                    width: double.infinity,
                    height: 400.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tests',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 250,
                              // width: double.infinity,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(3),
                                  itemCount: Biomarkers.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      trailing: TextButton(
                                        onPressed: () {controller.fetchWebUrl();},
                                        child: Text('show results'),
                                      ),
                                      title: Text(
                                        Biomarkers[index],
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(Icons.timelapse),
                              Text(' Time : ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              Text('1:00 AM',
                                  style: TextStyle(fontSize: 18.sp)),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Icon(Icons.calendar_month_sharp),
                              Text(' Date : ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              Text('5/10/2023',
                                  style: TextStyle(fontSize: 18.sp)),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Icon(Icons.monetization_on_sharp),
                              Text(' Total Price : ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              Text('150,000',
                                  style: TextStyle(fontSize: 18.sp)),
                              SizedBox(width: 5.00.w),
                              Text('SP', style: TextStyle(fontSize: 18.sp)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )))
            ],
          ),
        ),
      ],
    ));
  }
}

class Appointments {
  final String labortary_name;
  final String? Date;
  final DateTime? Time;
  final Image? image;
  List<String>? Biomarkers;
  final double? totalPrice;

  Appointments(
      {this.image,
      this.Biomarkers,
      this.totalPrice,
      this.Date,
      required this.labortary_name,
      this.Time});
}

Appointments appointment1 = new Appointments(
  image: Image.asset('assets/images/lablab.png'),
  totalPrice: 15.500,
  Biomarkers: ['CBC', 'Vitamin D', 'Calcium'],
  labortary_name: 'Al-Fayhaa',
);
