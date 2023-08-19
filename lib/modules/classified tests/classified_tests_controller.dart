import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:labapp/model/category_model.dart';
import 'package:labapp/modules/categorytests/category_service.dart';
import 'package:labapp/config/user_information.dart';
import 'package:labapp/modules/classified%20tests/classified_test_service.dart';
class ClassifiedController extends GetxController {
  var  classifiedtestList = [];
  ClassifiedTestService _service = ClassifiedTestService();
  var isLoding=true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    classifiedtestList =await _service.getCategoryoftest(UserInformation.USER_TOKEN);
    isLoding(false);
    super.onReady();

  }

  Future<void> CategoryOnClick() async {}
}
