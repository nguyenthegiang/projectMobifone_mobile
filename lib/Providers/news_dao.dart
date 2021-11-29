import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news.dart';

/* Class để thực hiện các chức năng với Server của News Class */
class NewsDAO with ChangeNotifier {
  List<News> _news = [];

  //function để generate data cho Database
  void generateNewsToDB() {
    //_news.add(value)
  }

  //function để add 1 news lên DB
  Future<void> addNews(News news) async {
    const url =
        'https://project-mobifone-default-rtdb.firebaseio.com/news.json';

    final timestamp = DateTime.now();

    //add to DB
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'title': news.title,
        'content': news.content,
        'imageUrl': news.imageUrl,
        'publishedAt': news.publishedAt,
      }),
    );

    //add to local list
    _news.add(news);

    notifyListeners();
  }

  //function để lấy list news từ Database
  void fetchNews() {}
}