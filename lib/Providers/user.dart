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
}
