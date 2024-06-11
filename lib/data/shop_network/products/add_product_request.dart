
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRequest {
    XFile? offerPic;
    uploadofferPic(XFile image) {
    offerPic = image;
  
  }

  Future<void> addProduct({
    required String name,
    XFile? offerPic,
    required String price,
    required String description,
    required String expire_time,
   
    required String category,
  }) async {
    var headers = {
      'Authorization': 'Token 15308df6ca6f4830f63fb8576344d8b6a3995406'
    };
    var data = FormData.fromMap({
         'image': offerPic,
         'name': name,
         'price': price,
         'description': description,
         'expire_time': expire_time,
         'category': category
      
    });

    var dio = Dio();
    await dio.request(
      'https://mnnt.shop/api/shop_products/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
  }
}