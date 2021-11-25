import 'package:flutter/material.dart';

//Appbar chung cho các Widget
class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  //AppBar cần implement PreferredSizeWidget
  const ScreenAppBar({
    Key? key,
  }) : super(key: key);

  //và Override biến này -> xác định height cho AppBar
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
