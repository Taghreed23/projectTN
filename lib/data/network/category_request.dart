import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class CategoryRequest {
  getCategoryData({required int id}) async {
    var headers = {
      'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
    };
    var request = http.MultipartRequest('GET', Uri.parse('${Api.category}$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}
