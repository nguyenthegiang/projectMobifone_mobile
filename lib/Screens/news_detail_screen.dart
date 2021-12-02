import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../Widget/screen_appbar.dart';
import '../../Providers/news.dart';
import '../Widget/app_drawer.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    //lấy news từ argument trong route để hiển thị
    final news = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      drawer: AppDrawer(),
      //Làm cho nó Scrollable
      body: Column(
        children: [
          Container(
            child: Hero(
              tag: news.imageUrl,
              child: Image.network(
                news.imageUrl,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    news.title,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(5.0),
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(news.publishedAt),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    news.content,
                    style: TextStyle(
                      color: Colors.grey[800],
                      //fontWeight: FontWeight,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
