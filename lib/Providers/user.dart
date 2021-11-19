import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

/* 
Class để chứa thông tin về 1 User; 
Thực hiện Login;
*/
class User with ChangeNotifier {
  final String username;
  final String password;
  bool isLoggedin;

  User({
    required this.username,
    required this.password,
    this.isLoggedin = false,
  });

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
