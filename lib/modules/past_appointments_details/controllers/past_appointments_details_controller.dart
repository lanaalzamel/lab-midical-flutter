import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PastAppointmentsDetailsController extends GetxController {
  RxString webUrl = ''.obs; // Default URL

  Future<void> fetchWebUrl() async {
    final response = await http.get(Uri.parse('https://mlab123.000webhostapp.com/api/results/show_result?user_id=2&test_id=1'));
    if (response.statusCode == 200) {
      webUrl.value = response.body;
    } else {
      throw Exception('Failed to load web view');
    }
  }
}
