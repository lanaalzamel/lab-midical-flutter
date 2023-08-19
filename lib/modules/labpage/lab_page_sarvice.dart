
import 'package:labapp/model/lab_model.dart';
import 'package:labapp/model/test_model.dart';
import 'dart:convert';
import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class LabService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.getlab);
  var message;
  Future<Lab?> getLabData(String token) async {
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData is List) {
        // Handle the case when jsonData is a list
        if (jsonData.isNotEmpty) {
          final labData = Lab.fromJson(jsonData[0]);
          return labData;
        } else {
          throw Exception('No lab data available');
        }
      } else if (jsonData is Map<String, dynamic>) {
        // Handle the case when jsonData is a map
        final labData = Lab.fromJson(jsonData);
        return labData;
      } else {
        throw Exception('Invalid lab data format');
      }
    } else {
      throw Exception('Failed to load lab data');
    }
  }


  var url1 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.getavalibletest);
  var message1;

  Future<List<Test>> getTest(String token) async {
    var response1 = await http.get(
      url1,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print('lanaaaaa');
    print(response1.statusCode);
    print(response1.body);
    if (response1.statusCode == 200) {
      var avalibletest = testFromJson(response1.body);
      return avalibletest;
    } else {
      return [];
    }
  }


}