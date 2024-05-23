import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class profileUpdateRequest {
  updateProfileData(
      {required String email,
      required String name,
      required String phone_number,
      required String birthday,
      required String gender,
       }) async {
    var headers = {
      'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
    };
    var request = http.MultipartRequest('PUT', Uri.parse('${Api.profile}'));

    request.headers.addAll(headers);
    request.fields.addAll({
      'email': "${email}",
      'name': '${name}',
      'phone_number': '${phone_number}',
      'gender': '${gender}',
      'birthday': '${birthday}',
      
    });

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}
