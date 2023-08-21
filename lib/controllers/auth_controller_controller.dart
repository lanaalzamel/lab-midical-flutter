import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthControllerController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


}