import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Widget/card_5_chart.dart';

class Card5 extends StatelessWidget {
  const Card5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            //1 số thành phần khác
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                    color: Color.fromARGB(255, 62, 144, 237),
                  ),
                  Column(
                    children: [
                      Text(
                        '+6,5K',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'New Users',
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 181, 202),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Chart
            Card5Chart(),
          ],
        ),
      ),
    );
  }
}
