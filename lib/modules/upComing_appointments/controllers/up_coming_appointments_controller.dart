import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../upComing_appointments/appointments_model.dart';

class UpComingAppointmentsController extends GetxController {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');
    print('token saved in shared preferences is : $savedToken');
    return savedToken;
  }

  var isloading = false.obs;
  Rx<Appointments>? Model = Appointments().obs;
  var isLoading = true.obs;
  var pimage;
  var appointments = <Appointments>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getUpAppointments();
    print('-------');
  }

  Future<void> getUpAppointments() async {
    final response = await http.get(
        Uri.parse(
            'https://mlab123.000webhostapp.com/api/appointments/pending_appointments'),
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
        });
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      appointments.value = jsonData.map((item) {
        return Appointments(
            labId: item['labId'],
            date: item['date'],
            hour: item['hour'],
            totalPrice: item['totalprice']);
      }).toList();
      print(' -------------------------------------');
    } else {
      int status = response.statusCode;
      print(' the status code for Up is $status');
      throw Exception('failed to load Up Appointments');
    }
  }
}

// packgesList.value = DigestAuthSuccessp.fromJson(json.decode(response.body)) as List;
//  packgesList.value = PackgeFromJsonQQP(json.decode(response.body));

// UpAppointments.value = PackgeFromJsonQQ(json.decode(response.body));
//   packgesList.value = PackgeFromJsonA(json.decode(response.body));
