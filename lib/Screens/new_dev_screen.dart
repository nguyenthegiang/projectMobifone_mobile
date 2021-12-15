import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';
import '../Widget/home_screen_widgets/card_6.dart';
import '../Widget/home_screen_widgets/card_5.dart';
import '../Widget/home_screen_widgets/card_4.dart';
import '../Widget/home_screen_widgets/card_3.dart';
import '../Widget/home_screen_widgets/card_2.dart';
import '../Widget/home_screen_widgets/card_1.dart';
import '../Widget/app_drawer.dart';

//Screen: Phát triển mới
class NewDevScreen extends StatelessWidget {
  const NewDevScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/new-dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      drawer: AppDrawer(),
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
