import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Color mainColor = Color(0xFF0087BB);
String fontfamily = 'RobotoSlab';
var MainBorder = BorderRadius.circular(32).w;
var appbarcolor = LinearGradient(
    end: Alignment.topLeft,
    begin: Alignment.bottomRight,
    colors: [mainColor, Colors.black]);
Widget AppBarModel = Container(
  height: 220.h,
  width: double.infinity.w,
  decoration: BoxDecoration(
    gradient: LinearGradient(
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
        colors: [Color(0xFF0087BB), Colors.black]),
    // color: Color(0xFF0087BB),
    borderRadius: BorderRadius.circular(32).w,
  ),
);
