import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';

//Màn hình hiển thị tra cứu
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      //Làm cho nó Scrollable
      body: SingleChildScrollView(),
    );
  }
}
