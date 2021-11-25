import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';

//Màn hình hiển thị tra cứu
class LookUpDisplayScreen extends StatelessWidget {
  const LookUpDisplayScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/lookup-display';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
    );
  }
}
