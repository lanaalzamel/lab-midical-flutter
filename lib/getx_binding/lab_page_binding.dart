import 'package:get/get.dart';
import 'package:labapp/modules/labpage/lab_page_controller.dart';
import 'package:labapp/modules/test_details/product_details_controller.dart';

class LabPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LabController>(LabController());
  }

}