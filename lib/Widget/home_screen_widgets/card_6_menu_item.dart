import 'package:flutter/material.dart';

import './card_6.dart';

//Class để Display 1 MenuItem dựa trên data của nó
class Card6MenuItem extends StatelessWidget {
  MenuItem menuItem;

  Card6MenuItem(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            //cho vào container để chỉnh size
            height: 60,
            width: 60,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: menuItem.icon,
              color: Color.fromARGB(255, 224, 240, 255),
              //bỏ shadow
              elevation: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  menuItem.detail,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
