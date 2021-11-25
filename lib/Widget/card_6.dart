import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Widget/card_6_menu_item.dart';

class Card6 extends StatelessWidget {
  //Khởi tạo list menu items
  List<MenuItem> listItems = [
    MenuItem(
      title: 'Briefing',
      detail: 'Project Manager',
      icon: Icon(
        Icons.stacked_bar_chart,
        color: Color.fromARGB(255, 48, 153, 255),
      ),
    ),
    MenuItem(
      title: 'Design',
      detail: 'Art Director',
      icon: Icon(
        Icons.design_services,
        color: Color.fromARGB(255, 251, 174, 32),
      ),
    ),
    MenuItem(
      title: 'Logics',
      detail: 'Lead Developer',
      icon: Icon(
        Icons.chat_rounded,
        color: Color.fromARGB(255, 34, 191, 190),
      ),
    ),
    MenuItem(
      title: 'Development',
      detail: 'DevOps',
      icon: Icon(
        Icons.insert_link_rounded,
        color: Color.fromARGB(255, 241, 80, 96),
      ),
    ),
    MenuItem(
      title: 'Testing',
      detail: 'QA Managers',
      icon: Icon(
        Icons.verified_user_rounded,
        color: Color.fromARGB(255, 181, 163, 249),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          child: Column(
            children: [
              //Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tasks Overview',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              /*List menu: dùng map() để tạo 1 Card6MenuItem() Widget với mỗi
              phần tử trong list menu*/
              ...listItems.map((menuItem) => Card6MenuItem(menuItem)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

//Class để lưu trữ thông tin về 1 menu item
class MenuItem {
  String title;
  String detail;
  Icon icon;

  MenuItem({
    required this.title,
    required this.detail,
    required this.icon,
  });
}
