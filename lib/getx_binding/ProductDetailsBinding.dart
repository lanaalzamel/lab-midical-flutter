import 'package:get/get.dart';
import 'package:labapp/modules/test_details/product_details_controller.dart';

class ProductDetailsViewBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController());
  }

}