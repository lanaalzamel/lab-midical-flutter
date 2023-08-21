import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/app/modules/home/views/home_view.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future loginApi(String email, String password) async {
    try {
      var response = await http.post(
          Uri.parse('https://mlab123.000webhostapp.com/api/auth/login'),
          body: <String, String>{'email': email, 'password': password},
          headers: {'Accept': 'application/json'});
      print(response.body);
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        String token = data['token'];
        print('the token is $token');
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString("token", token);

        Get.snackbar('Login successful', 'welcome back');
        Get.to(HomeView());
      } else {
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (error) {
      Get.snackbar('Exception', error.toString());
      print(error);
    }
  }
}
