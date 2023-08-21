import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResultsController extends GetxController {
  var testDataList = <TestData>[].obs;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('YOUR_API_URL'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      testDataList.assignAll(
        responseData.map((data) => TestData(
          testName: data['Test Name'],
          results: data['Results'],
          range: data['Range'],
          status: data['Status'],
        )).toList(),
      );
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
class TestData {
  final String testName;
  final String results;
  final String range;
  final String status;

  TestData({
    required this.testName,
    required this.results,
    required this.range,
    required this.status,
  });
}