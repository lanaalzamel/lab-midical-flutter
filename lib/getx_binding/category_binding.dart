import 'package:get/get.dart';
import 'package:labapp/modules/categorytests/category_controller.dart';
import 'package:labapp/modules/classified%20tests/classified_tests_controller.dart';

class CategoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ClassifiedController>(ClassifiedController());
  }

}