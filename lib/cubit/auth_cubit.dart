import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/cubit/auth_state.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  XFile? profilePic;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String username,
    required String password,
    required String name,
    required String phone_number,
    required String gender,
    required String birthday,
    XFile? profilePic,
  }) async {
    try {
      emit(AuthLoading());
      var data = FormData.fromMap({
        'image': profilePic,
        'email': email,
        'username': username,
        'name': name,
        'phone_number': phone_number,
        'gender': gender,
        'birthday': birthday,
        'password': password
      });
      var dio = Dio();
      var response = await dio.request(
        'https://mnnt.shop/api/register/',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // Handle successful registration
        emit(AuthLoaded());
      } else {
        // Handle error
        emit(AuthError(
            error: 'Register failed with status code: ${response.statusCode}'));
      }
    } catch (error) {
      emit(AuthError(error: 'Error: $error'));
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      // Construct the URL with query parameters
      final url = Uri.parse(
          'https://mnnt.shop/api/login?username=$username&password=$password');

      // Send the HTTP GET request
      final response = await http.get(url);

      // Check the response status code
      if (response.statusCode == 200) {
        // Handle successful login
        emit(AuthLoaded());
      } else {
        // Handle error
        emit(AuthError(
            error: 'Login failed with status code: ${response.statusCode}'));
      }
    } catch (error) {
      emit(AuthError(error: 'Error: $error'));
    }
  }
}
