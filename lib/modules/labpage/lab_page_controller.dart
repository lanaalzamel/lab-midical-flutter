import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/model/lab_model.dart';
import 'package:labapp/model/test_model.dart';
import 'package:labapp/modules/labpage/lab_page_sarvice.dart';
import 'package:labapp/modules/test_details/test_details.dart';
import '../../config/user_information.dart';
import 'dart:convert';

class LabController extends GetxController {
  final LabService _labService = LabService();
  var isLoding=true.obs;
  List<Test> AvailableTestList = [];
  final  labData = Lab(
    id: 0,
    name: '',
    addressId: 0,
    phoneNumber: 0,
    certificate: '',
    rate: 0,
    image: '',
    workHours: '',
  ).obs;

  void navigateToProductDetailsView(int index) {
    final Test testItem = AvailableTestList[index];
    final TestDetailed testDetailed = TestDetailed(
      testItem.name,
      testItem.price.toString(),
      testItem.image,
      testItem.description,
      testItem.id.toString(),
    );
    Get.to(() => ProductDetailsView(testItem: testDetailed));
  }
  @override
  void onReady() async {
    try {
      final data = await _labService.getLabData(UserInformation.USER_TOKEN);
       AvailableTestList =await _labService.getTest(UserInformation.USER_TOKEN);
      if (data != null) {
        labData.value = data;
      }
    } catch (e) {
      print('Failed to fetch lab data: $e');
      // Handle the error as needed.
    }
    isLoding(false);
    super.onReady();
  }}