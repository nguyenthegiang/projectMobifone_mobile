import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/card3_chart_data.dart';

/* Class để thực hiện các chức năng với Server của Home Screen */
class HomeScreenDAO with ChangeNotifier {
  //Biến để lưu giữ data của chart
  List<Card3ChartData> card3ChartData = [];

  //function để gọi API lấy Data cho Chart
  Future<void> getcard3ChartData() async {
    final url = 'http://mobi.test.bcdcnt.net/dashboard_dttkc';

    //get request để lấy data và gán vào biến
    try {
      final response = await http.get(Uri.parse(url));
      //Decode data từ JSON sang Map
      //có thể null nếu server ko có dữ liệu
      final List<Map<String, String>>? extractedData =
          json.decode(response.body) as List<Map<String, String>>?;

      //null thì return luôn
      if (extractedData == null) {
        return;
      }

      //list chứa data lấy về
      final List<Card3ChartData> loadedData = [];
      //Với mỗi phần tử của Map thì add vào list data
      for (var element in extractedData) {
        loadedData.add(Card3ChartData(
            element['PROVINCE_CODE'] as String, element['DTTKC'] as String));
      }

      //gán vào attribute của class
      card3ChartData = loadedData;

      notifyListeners();
    } catch (error) {
      print(error);
      //nếu có lỗi thì tung ra để xử lý ở Widget
      rethrow;
    }
  }
}
