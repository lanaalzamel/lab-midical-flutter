import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginproviderProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://reqres.in/api/login';
  }
}

Future login_Api() async {
  var response = await http.post(Uri.parse('https://reqres.in/api/login'));
}
