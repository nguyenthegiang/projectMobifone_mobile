import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

import './user.dart';

/* Class để thực hiện các chức năng với Server của User Class */
class UserDAO with ChangeNotifier {
  /* Function để thực hiện chức năng Login cho User truyền vào = cách gửi 
  HTTP Requests đến Server;
  Chuyển Server sang Firebase -> online -> để có thể dùng App ở mọi nơi;
  API Key: Web API key - https://console.firebase.google.com/u/0/project/project-mobifone/settings/general
   */
  Future<void> login(User user) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBqpARvsGMMzUZ0fEYS2X--Sd98cJWbqMw';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': user.username,
          'password': user.password,
          'returnSecureToken': true,
        }),
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Charset': 'utf-8',
        // },
      );

      // /*Nhận về và phân tích response ở đây, nếu login ko thành công thì cx
      // throw error*/
      // if (json.decode(response.body)['answer'].toString() == 'FAILED') {
      //   throw Exception();
      // }

      /* Chuyển sang Firebase */
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        /*nếu có key 'error' trong Map (khi có lỗi sẽ có) thì throw ra cái 
        exception mà mình tạo ra*/
        throw HttpException(responseData['error']['message']);
        //throw ra cái message của Firebase -> xử lý bên auth_screen
      }
    } catch (error) {
      rethrow;
    }
  }
}
