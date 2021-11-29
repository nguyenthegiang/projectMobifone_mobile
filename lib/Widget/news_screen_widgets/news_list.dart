import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './news_list_item.dart';
import '../../Providers/news_dao.dart';

//hiển thị list các news trong news_list_screen
class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsDAO>(context);

    return ListView(
      children: [
        ...newsProvider.items.map((news) {
          //truyền thông tin news vào để hiển thị theo
          return NewsListItem(news);
        }).toList(),
      ],
    );
  }
}
