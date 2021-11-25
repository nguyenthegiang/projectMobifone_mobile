import 'package:flutter/material.dart';

class Card1MenuItem extends StatelessWidget {
  final Icon menuIcon;
  final String menuText;
  final Color backgroundColor;
  final Color itemColor;

  //1 số Property nhận vào để customize nội dung của từng menu item
  Card1MenuItem({
    required this.menuIcon,
    required this.menuText,
    required this.backgroundColor,
    required this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //...
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Column(
          //children align về bên trái
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuIcon,
            Text(
              menuText,
              style: TextStyle(
                color: itemColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
