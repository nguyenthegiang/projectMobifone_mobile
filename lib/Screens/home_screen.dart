import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //Demo trang Home Page: làm cái link đến thôi

  //Tạo Route cho Navigation
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Home Page Scaffold
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("My Home  Page"),
      ),
    );
  }
}
