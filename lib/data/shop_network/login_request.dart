import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class SLoginRequest {
  SloginRequest({required String username ,required String password}) async {
 
    var request = http.MultipartRequest('GET', Uri.parse('https://mnnt.shop/api/shop_login/?username=$username&password=$password'));

 

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}