import 'package:flutter/material.dart';
import './card_2_chart.dart';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Card2Chart(),
      ),
    );
  }
}
