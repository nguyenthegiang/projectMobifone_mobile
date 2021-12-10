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

      print(json.decode(response.body));

      //Lấy dữ liệu trả về
      try {
        /*cho vào try catch để nếu trg hợp ko có data thì nó 
        cx ko throw lỗi*/
        phoneInfo = json.decode(response.body)['data'][0];
        //nếu lấy data thành công thì isSuccess = true
        isSuccess = true;
      } catch (exception) {
        //nếu exception -> data null -> isSuccess = false
        //cái này để điều chỉnh UI tương ứng
        isSuccess = false;
        print(exception);
      }
    } catch (error) {
      print(error);
      rethrow;
    }

    notifyListeners();
  }
}
