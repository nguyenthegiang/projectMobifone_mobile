import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/card1_chart_data.dart';
import '../models/card2_chart_data.dart';
import '../models/card3_chart_data.dart';
import '../models/card4_chart_data.dart';

/* Class để thực hiện các chức năng với Server của Home Screen */
class HomeScreenDAO with ChangeNotifier {
  //Biến để lưu giữ data của chart
  List<Card3ChartData> card3ChartData = [];
  List<Card2ChartData> card2ChartData = [];
  List<Card4ChartData> card4ChartData = [];
  List<Card1ChartData> card1ChartData = [];

  //function để gọi API lấy Data cho Chart của Card3
  Future<void> getcard3ChartData() async {
    const url = 'http://mobi.test.bcdcnt.net/dashboard_dttkc';

    //get request để lấy data và gán vào biến
    try {
      final response = await http.get(Uri.parse(url));
      //Decode data từ JSON sang List Map
      //https://stackoverflow.com/questions/60285825/dart-cannot-convert-listdynamic-to-listmapstring-dynamic-despite-cast
      final extractedData = (jsonDecode(response.body)["data"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      //list chứa data lấy về
      final List<Card3ChartData> loadedData = [];
      //Với mỗi phần tử của Map thì add vào list data
      for (var element in extractedData) {
        loadedData.add(Card3ChartData(
            element['PROVINCE_CODE'] as String, int.parse(element['DTTKC'])));
      }

      //gán vào attribute của class
      card3ChartData = loadedData;

      //print thử ra console
      card3ChartData.forEach((element) {
        print(element.DTTKC);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      //nếu có lỗi thì tung ra để xử lý ở Widget
      rethrow;
    }
  }

  //function để gọi API lấy Data cho Chart của Card2
  Future<void> getcard2ChartData() async {
    const url = 'http://mobi.test.bcdcnt.net/dashboard_vlr';

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = (jsonDecode(response.body)["data"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final List<Card2ChartData> loadedData = [];
      for (var element in extractedData) {
        loadedData.add(
          Card2ChartData(
            DateTime.parse(element['START_DATE']),
            int.parse(element['KHCN']),
            int.parse(element['KHDN']),
            int.parse(element['TOTAL']),
          ),
        );
      }

      card2ChartData = loadedData;

      //print thử ra console
      card2ChartData.forEach((element) {
        print(element.StartDate);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      //nếu có lỗi thì tung ra để xử lý ở Widget
      rethrow;
    }
  }

  //function để gọi API lấy Data cho Chart của Card4
  Future<void> getcard4ChartData() async {
    const url = 'http://mobi.test.bcdcnt.net/dashboard_ptm';

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = (jsonDecode(response.body)["data"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final List<Card4ChartData> loadedData = [];
      for (var element in extractedData) {
        loadedData.add(
          Card4ChartData(
            DateTime.parse(element['ISSUE_DATE']),
            int.parse(element['TBTT']),
            int.parse(element['TBTS']),
            int.parse(element['TOTAL']),
          ),
        );
      }

      card4ChartData = loadedData;

      //print thử ra console
      card4ChartData.forEach((element) {
        print(element.IssueDate);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      //nếu có lỗi thì tung ra để xử lý ở Widget
      rethrow;
    }
  }

  //function để gọi API lấy Data cho Chart của Card1
  Future<void> getcard1ChartData() async {
    const url = 'http://mobi.test.bcdcnt.net/dashboard_plan';

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = (jsonDecode(response.body)["data"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final List<Card1ChartData> loadedData = [];
      for (var element in extractedData) {
        loadedData.add(
          Card1ChartData(
            double.parse(element['VLR']),
            double.parse(element['DTTT']),
            double.parse(element['PTM']),
          ),
        );
      }

      card1ChartData = loadedData;

      notifyListeners();
    } catch (error) {
      print(error);
      //nếu có lỗi thì tung ra để xử lý ở Widget
      rethrow;
    }
  }
}
