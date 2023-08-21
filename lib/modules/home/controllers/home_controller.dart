import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model.dart';
import '/app/modules/home/top_lab_model.dart';

class HomeController extends GetxController {
  var isloading = false.obs;
  Rx<TopLab>? Model = TopLab().obs;
  var isLoading = true.obs;
  var pimage;
  var toplabList = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // getTopLabs();
    fetchB();
  }

  Future<void> fetchB() async {
    final response = await http.get(
        Uri.parse('https://mlab123.000webhostapp.com/api/labs/top_rated_labs'));

    if (response.statusCode == 200) {

      toplabList.value = PackgeFromJsonQQ(json.decode(response.body));
      //   packgesList.value = PackgeFromJsonA(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load package');
    }
  }

  // getTopLabs() async {
  //   try {
  //     isloading(true);
  //     http.Response response = await http.get(Uri.parse(
  //         'https://mlab123.000webhostapp.com/api/labs/top_rated_labs'));
  //     if (response.statusCode == 200) {
  //       var result = jsonDecode(response.body);
  //       Model = TopLab.fromJson(result);
  //       Future.delayed(Duration(seconds: 2), () {
  //         isloading(false);
  //       });
  //     }
  //   } catch (e) {
  //     print('Error while getting Top Labs is $e');
  //   }
  // }
}
