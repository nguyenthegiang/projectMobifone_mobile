import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './user.dart';

/* Class để thực hiện các chức năng với Server của User Class */
class UserDAO with ChangeNotifier {
  /* Function để thực hiện chức năng Login cho User truyền vào = cách gửi 
  HTTP Requests đến Server */
  Future<void> login(User user) async {
    const url = 'http://10.0.2.2:8000/api/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'username': user.username,
          'password': user.password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
        },
      );

      /*Nhận về và phân tích response ở đây, nếu login ko thành công thì cx
      throw error*/
      if (json.decode(response.body)['answer'].toString() == 'FAILED') {
        throw Exception();
      }
    } catch (error) {
      rethrow;
    }
  }
}
