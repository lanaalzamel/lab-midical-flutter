import 'package:get/get.dart';

import '../appointments_model.dart';

class AppointmentsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Appointments.fromJson(map);
      if (map is List)
        return map.map((item) => Appointments.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Appointments?> getAppointments(int id) async {
    final response = await get('appointments/$id');
    return response.body;
  }

  Future<Response<Appointments>> postAppointments(
          Appointments appointments) async =>
      await post('appointments', appointments);
  Future<Response> deleteAppointments(int id) async =>
      await delete('appointments/$id');
}
