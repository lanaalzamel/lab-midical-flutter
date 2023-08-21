import 'package:get/get.dart';

import '../top_lab_model.dart';

class TopLabProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return TopLab.fromJson(map);
      if (map is List) return map.map((item) => TopLab.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<TopLab?> getTopLab(int id) async {
    final response = await get('toplab/$id');
    return response.body;
  }

  Future<Response<TopLab>> postTopLab(TopLab toplab) async =>
      await post('toplab', toplab);
  Future<Response> deleteTopLab(int id) async => await delete('toplab/$id');
}
