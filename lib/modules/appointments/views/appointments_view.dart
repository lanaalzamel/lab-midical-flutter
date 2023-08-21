import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lab_app/app/modules/past_appointments/views/past_appointments_view.dart';
import '../../upComing_appointments/views/up_coming_appointments_view.dart';
import '/app/modules/past_appointments_details/views/past_appointments_details_view.dart';
import '/app/modules/upComing_appointments_details/views/up_coming_appointments_details_view.dart';
import '/app/views/views/constants_view.dart';

import '../controllers/appointments_controller.dart';

class AppointmentsView extends GetView<AppointmentsController> {
  const AppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                    colors: [mainColor, Colors.black])),
          ),
          toolbarHeight: 70.h,
          title: Text('Your appointments'),
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Up coming",
              ),
              Tab(
                text: "past",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [UpComingAppointmentsView(), PastAppointmentsView()],
        ),
      ),
    );
  }
}


