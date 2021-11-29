import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Data/news_dummy_data.dart';

import 'news.dart';

/* Class để thực hiện các chức năng với Server của News Class */
class NewsDAO with ChangeNotifier {
  List<News> _news = [];

  //Getter
  List<News> get items {
    return [..._news];
  }

  /*function để generate data cho Database: lúc nào cần gen lại data thì mới
  gọi đến thôi*/
  void generateNewsToDB() {
    //với mỗi phần tử của listNews
    NewsDUMMYDATA.listNews.forEach((element) {
      //add vào list local
      _news.add(element);
      //add lên DB
      addNews(element);
    });
  }

  //function để add 1 news lên DB
  Future<void> addNews(News news) async {
    const url =
        'https://project-mobifone-default-rtdb.firebaseio.com/news.json';

    //add to DB
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'title': news.title,
        'content': news.content,
        'imageUrl': news.imageUrl,
        'publishedAt': news.publishedAt.toIso8601String(),
      }),
    );

    //add to local list
    _news.add(news);

    notifyListeners();
  }

  //function để lấy list news từ Database
  Future<void> fetchNews() async {
    const url =
        'https://project-mobifone-default-rtdb.firebaseio.com/news.json';

    final response = await http.get(Uri.parse(url));

    final List<News> loadedNews = [];

    //extractedData có thể null nếu ko có dữ liệu trên server
    final Map<String, dynamic>? extractedData =
        json.decode(response.body) as Map<String, dynamic>?;

    //nếu null thì khỏi add vào list ở local làm gì, đỡ lỗi
    if (extractedData == null) {
      return;
    }

    //Lấy ra list news
    extractedData.forEach((key, newsData) {
      loadedNews.add(News(
        title: newsData['title'],
        content: newsData['content'],
        imageUrl: newsData['imageUrl'],
        publishedAt: DateTime.parse(newsData['publishedAt']),
      ));
    });

    //gán vào list ở local
    _news = loadedNews.toList();

    notifyListeners();
  }
}
