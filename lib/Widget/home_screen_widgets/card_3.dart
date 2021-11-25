import 'package:flutter/material.dart';
import './card_3_chart.dart';

class Card3 extends StatelessWidget {
  const Card3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Card3Chart(),
      ),
    );
  }
}
