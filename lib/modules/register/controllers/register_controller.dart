import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/views/views/constants_view.dart';

class RegisterController extends GetxController {
  var selectedGender = "".obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final first_nameController = TextEditingController().obs;
  final last_nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final phone_numberController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final account_type = 0.toString();

  String get birth_date {
    return '${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}';
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future registerApi(
      String first_name,
      String last_name,
      String email,
      String password,
      String? address,
      String phone_number,
      String gender,
      String birth_date,
      String account_type) async {
    try {
      var response = await http.post(
          Uri.parse('https://mlab123.000webhostapp.com/api/auth/register'),
          body: {
            'email': email,
            'password': password,
            'first_name': first_name,
            'last_name': last_name,
            'address': address,
            'phone_number': phone_number,
            'gender': gender,
            'birth_date': birth_date,
            'account_type': account_type.toString(),
          },
          headers: {
            'Accept': 'application/json'
          });
      print(response.body);
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        String token = data['token'];
        print('the token is $token');

        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString("token", token);
        print(prefs);
        Get.snackbar('successful', 'welcome To our application');
        Get.to(() => HomeView());
      } else {
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (error) {
      Get.snackbar('Exception', error.toString());
      print(error);
    }
  }

  void setGender(value) {
    print(value);
    selectedGender.value = value;
    update();
  }

  chooseDate() async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: mainColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1950),
        lastDate: DateTime(2024),
        helpText: 'Select Date Of Birth',
        cancelText: 'Close',
        confirmText: 'Done');
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
