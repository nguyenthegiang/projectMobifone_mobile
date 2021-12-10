import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/* Class để thực hiện các chức năng với Server của LookUp_Display Screen */
class LookUpDAO with ChangeNotifier {
  //Tìm SDT trong Danh sách để hiển thị thông tin chi tiết
  Future<void> lookUp(String phoneNum) async {
    const url = 'http://mobi.test.bcdcnt.net/tracuuchitiet';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'sdt',
          phoneNum,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
        },
      );

      print(json.decode(response.body));
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
