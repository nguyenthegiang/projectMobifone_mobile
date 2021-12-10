import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/* Class để thực hiện các chức năng với Server của LookUp_Display Screen */
class LookUpDAO with ChangeNotifier {
  //biến để lưu trữ dữ liệu trả về
  bool isSuccess = false;
  late Map<String, dynamic> phoneInfo;

  //Tìm SDT trong Danh sách để hiển thị thông tin chi tiết
  Future<void> lookUp(String phoneNum) async {
    const url = 'http://mobi.test.bcdcnt.net/tracuuchitiet';

    try {
      //Gửi request
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'sdt': phoneNum,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
        },
      );

      //Lấy dữ liệu trả về
      phoneInfo = json.decode(response.body)['data'][0] ?? [];
      isSuccess = json.decode(response.body)['success'];
    } catch (error) {
      print(error);
      rethrow;
    }

    notifyListeners();
  }
}
