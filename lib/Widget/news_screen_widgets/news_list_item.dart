import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../Providers/news.dart';
import '../../Screens/news_detail_screen.dart';

class NewsListItem extends StatelessWidget {
  final News news;

  //nhận về 1 news để hiển thị
  NewsListItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              //Hero Widget để làm Animation Transition khi navigate giữa 2 page
              child: Hero(
                tag: news.imageUrl,
                child: Image.network(
                  news.imageUrl,
                  fit: BoxFit.cover,
                  height: 70.0,
                  width: 70.0,
                ),
              ),
            ),
            title: Text(news.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: Text(
              //Dùng intl package để format date
              DateFormat('yyyy-MM-dd').format(news.publishedAt),
            ),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade100],
                begin: Alignment.centerRight,
                end: new Alignment(-1.0, -1.0)),
          ),
        ),
        onTap: () {
          //Chuyển sang News Detail Screen
          Navigator.of(context).pushNamed(NewsDetailScreen.routeName);
        },
      ),
    );
  }
}
