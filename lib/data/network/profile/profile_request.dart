import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class ProfileRequest {
  getProfileData() async {
    var headers = {
      'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
    };
    var request = http.MultipartRequest('GET', Uri.parse('${Api.profile}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}
