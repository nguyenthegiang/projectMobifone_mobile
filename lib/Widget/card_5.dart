import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Widget/card_5_chart.dart';

class Card5 extends StatelessWidget {
  const Card5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Card5Chart(),
      ),
    );
  }
}
