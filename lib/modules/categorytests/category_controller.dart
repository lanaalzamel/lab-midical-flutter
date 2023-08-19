import 'package:get/get.dart';
import 'package:labapp/modules/categorytests/category_service.dart';
import 'package:labapp/config/user_information.dart';
class CategoryController extends GetxController {
  var categoryList = [];
  CategoryService _service = CategoryService();
 var isLoding=true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    categoryList=await _service.getCategoryoftest(UserInformation.USER_TOKEN);
  isLoding(false);
    super.onReady();

  }

  Future<void> CategoryOnClick() async {}
}
