import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      //Làm cho nó Scrollable
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Text('hi'),
        ),
      ),
    );
  }
}
