import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../past_appointments_details/views/past_appointments_details_view.dart';
import '../controllers/past_appointments_controller.dart';

class PastAppointmentsView extends GetView<PastAppointmentsController> {
  PastAppointmentsView({Key? key}) : super(key: key);
  PastAppointmentsController controller = Get.put(PastAppointmentsController());

  @override
  Widget build(BuildContext context) {
    print(controller.PastAppointments.length);
    return Obx(() {
      if (controller.isLoading.value) {
        Future.delayed(const Duration(seconds: 2), () {
          controller.isLoading.value = false;
        });

        return Center(child: CircularProgressIndicator());
      } else
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.PastAppointments.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10).r,
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => PastAppointmentsDetailsView());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.grey[300],
                      child: Container(
                        height: 130.h,
                        child: Padding(
                          padding: const EdgeInsets.all(10).r,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // CircleAvatar(
                                //   backgroundImage: AssetImage(
                                //       controller.PastAppointments[index].image),
                                //   radius: 45,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(20).r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //     controller.PastAppointments[index].name,
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 18.sp)),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          Icon(Icons.timelapse,size: 20,),
                                          SizedBox(width: 5.0,),
                                          Text('Time : '),
                                          Text(controller
                                              .PastAppointments[index].hour!),
                                          // Text(' to '),
                                          // Text(controller
                                          //     .PastAppointments[index].closeHour),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month,size: 20.sp),
                                          SizedBox(width: 5.0.w),
                                          Text('Date : '),
                                          Text(controller
                                              .PastAppointments[index].date
                                              .toString()),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Icon(Icons.monetization_on_sharp,size: 20,),
                                          SizedBox(width: 5.0.w),
                                          Text('Total Price : '),
                                          Text(controller
                                              .PastAppointments[index]
                                              .totalPrice
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ))));
    });
  }
}
