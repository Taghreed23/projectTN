import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

import 'package:dio/dio.dart';

class ProfileUpdateRequest {
  Future<void> updateProfileData({
    required String email,
   
    required String phone_number,
    required String birthday,
    required String gender,
  }) async {
    var headers = {
      'Authorization': 'Token ea14ef561d160843f22f97621dd1e6995e72f1c0'
    };
    var data = FormData.fromMap({
        'email': email,
        'name': 'nourmaged',
        'phone_number': phone_number,
        'gender': gender,
        'birthday': birthday,
      
    });

    var dio = Dio();
    await dio.request(
      '${Api.profile}',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );
  }
}
