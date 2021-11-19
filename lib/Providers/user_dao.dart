import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './user.dart';

/* Class để thực hiện các chức năng với Server của User Class */
class UserDAO with ChangeNotifier {
  /* Function để thực hiện chức năng Login cho User truyền vào = cách gửi 
  HTTP Requests đến Server */
  Future<void> login(User user) async {
    const url = 'Enter_URL_here';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'username': user.username,
          'password': user.password,
        }),
      );

      /*Nhận về và phân tích response ở đây, nếu login ko thành công thì cx
      throw error*/
    } catch (error) {
      rethrow;
    }
  }
}
