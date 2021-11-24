import 'package:flutter/material.dart';

import '../Widget/card_1.dart';

//Home Page
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Logo
        title: Image.asset('assets/images/appBar_logo.png', fit: BoxFit.cover),
        backgroundColor: const Color.fromARGB(255, 26, 26, 38),
        //3 nút trên AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.article_outlined),
            iconSize: 30.0,
            onPressed: () {
              //...
            },
            color: const Color.fromARGB(255, 71, 79, 100),
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0,
            onPressed: () {
              //...
            },
            color: const Color.fromARGB(255, 71, 79, 100),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 30.0,
            onPressed: () {
              //..
            },
            color: const Color.fromARGB(255, 71, 79, 100),
          ),
        ],
      ),
      //Làm cho nó Scrollable
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card1(),
          ],
        ),
      ),
    );
  }
}
