import 'package:flutter/material.dart';

import 'card_1_menu_item.dart';

//Chứa các Menu button của Card
class Card1Menu extends StatelessWidget {
  const Card1Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView(
        padding: const EdgeInsets.all(25),
        //Scrollable
        physics: const ScrollPhysics(),
        children: [
          //Extract Widget: card_1_menu.dart
          Card1MenuItem(
            menuIcon: Icon(
              Icons.bar_chart_rounded,
              color: Color.fromARGB(255, 254, 167, 0),
              size: 45,
            ),
            menuText: 'VLR trung bình tháng',
            backgroundColor: Color.fromARGB(255, 255, 244, 222),
            itemColor: Color.fromARGB(255, 254, 167, 0),
          ),
          Card1MenuItem(
            menuIcon: Icon(
              Icons.person_add_alt_1_rounded,
              color: Color.fromARGB(255, 54, 153, 255),
              size: 45,
            ),
            menuText: 'New Users',
            backgroundColor: Color.fromARGB(255, 224, 240, 255),
            itemColor: Color.fromARGB(255, 54, 153, 255),
          ),
          Card1MenuItem(
            menuIcon: Icon(
              Icons.collections_bookmark_rounded,
              color: Color.fromARGB(255, 246, 77, 98),
              size: 45,
            ),
            menuText: 'Item Orders',
            backgroundColor: Color.fromARGB(255, 255, 226, 230),
            itemColor: Color.fromARGB(255, 246, 77, 98),
          ),
          Card1MenuItem(
            menuIcon: Icon(
              Icons.bug_report_rounded,
              color: Color.fromARGB(255, 19, 197, 186),
              size: 45,
            ),
            menuText: 'Bug Reports',
            backgroundColor: Color.fromARGB(255, 201, 247, 245),
            itemColor: Color.fromARGB(255, 19, 197, 186),
          ),
        ],
        //Layout cho Grid
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
