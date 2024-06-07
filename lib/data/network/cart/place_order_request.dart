import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';
import 'package:dio/dio.dart';
class PlaceOrderRequest {
  PlaceOrder() async {
   var headers = {
  'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
};
var dio = Dio();
var response = await dio.request(
  'https://mnnt.shop/api/make_order/',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
}
else {
  print(response.statusMessage);
}
  }
}