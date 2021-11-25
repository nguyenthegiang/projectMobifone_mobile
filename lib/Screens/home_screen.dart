import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';
import '../Widget/card_6.dart';
import '../Widget/card_5.dart';
import '../Widget/card_4.dart';
import '../Widget/card_3.dart';
import '../Widget/card_2.dart';
import '../Widget/card_1.dart';

//Home Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      //Làm cho nó Scrollable
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //có thể chuyển sang ListView.builder
            Card1(),
            Card2(),
            Card3(),
            Card4(),
            Card5(),
            Card6(),
          ],
        ),
      ),
    );
  }
}
