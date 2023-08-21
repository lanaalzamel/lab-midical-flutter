import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../user_model_model.dart';

class ProfileDetailsController extends GetxController {
  var isLoading = false.obs;
  final user = Rxn<UserInfo>();
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');
    print('token saved in shared preferences is : $savedToken');
    return savedToken;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse('https://mlab123.000webhostapp.com/api/auth/user_info'),
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
          }
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<dynamic, dynamic>;
        final data = UserInfo.fromJson(jsonData);
        user.value = data;


       }
      else{
        int status = response.statusCode;
      }
    } catch (e) {

      print('Error fetching user information: $e');
    }
    }
  }



