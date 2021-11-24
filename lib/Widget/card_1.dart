import 'package:flutter/material.dart';

import './card_1_menu.dart';
import './card_1_chart.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            //Radial Bar Chart
            Card1Chart(),
            //Vài Button xếp trong GridView
            Card1Menu(),
          ],
        ),
      ),
    );
  }
}
