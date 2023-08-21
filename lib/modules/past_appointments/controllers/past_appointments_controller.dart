import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../profile_details/model.dart';
import '../../upComing_appointments/appointments_model.dart';

class PastAppointmentsController extends GetxController {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');
    print('token saved in shared preferences is : $savedToken');
    return savedToken;
  }

  var isloading = false.obs;
  Rx<Appointments>? Model = Appointments().obs;
  var isLoading = true.obs;
  var PastAppointments = <Appointments>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getPastAppointments();

  }

  Future<void> getPastAppointments() async {
    final response = await http.get(
        Uri.parse(
            'https://mlab123.000webhostapp.com/api/appointments/done_appointments'),
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
        });
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      PastAppointments.value = jsonData.map((item) {
        return Appointments(
            labId: item['labId'],
            date: item['date'],
            hour: item['hour'],
            totalPrice: item['totalprice']);

      }).toList();
    } else {
      int status = response.statusCode;
      print(' the status code for past is $status');
      //  throw Exception('Failed to load packge');
    }
  }
}
