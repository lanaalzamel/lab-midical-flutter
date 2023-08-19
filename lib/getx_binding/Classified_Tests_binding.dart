import 'package:get/get.dart';
import '../modules/test_details/product_details_controller.dart';

class ClassifiedTestsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController());
  }

}