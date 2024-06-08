import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class ShopProductRequest {
  getShopProductData() async {
    var headers = {
      'Authorization':
          'Token 15308df6ca6f4830f63fb8576344d8b6a3995406'
    };
    var request = http.MultipartRequest('GET', Uri.parse('${Api.shopProduct}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}