import 'package:flutter/material.dart';
import './card_4_chart.dart';

class Card4 extends StatelessWidget {
  const Card4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Card4Chart(),
      ),
    );
  }
}
