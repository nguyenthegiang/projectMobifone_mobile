import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //Demo trang Home Page: làm cái link đến thôi

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
