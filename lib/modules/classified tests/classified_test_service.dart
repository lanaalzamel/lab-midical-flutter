import 'package:http/http.dart' as http;
import 'package:labapp/config/server_config.dart';
import 'package:labapp/model/category_model.dart';

class ClassifiedTestService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.getCategory);
  var message;

  Future<List<Categoryoftest>> getCategoryoftest(String token) async {
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print('ddddd');
      var category = categoryFromJson(response.body);
      return category;
    } else {
      return [];
    }
  }
}