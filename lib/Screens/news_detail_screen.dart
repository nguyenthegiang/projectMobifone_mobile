import 'package:flutter/material.dart';

import '../Widget/screen_appbar.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      //Làm cho nó Scrollable
      body: Column(
        children: [
          Container(
            child: Hero(
              tag:
                  'https://iem.hcmiu.edu.vn/wp-content/uploads/2020/11/book.jpg',
              child: Image.network(
                'https://iem.hcmiu.edu.vn/wp-content/uploads/2020/11/book.jpg',
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'TestTesttest',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(5.0),
                  child: Text(
                    '11/11/2011',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'lorem, ipsum dolor sit amet consectetur adipiscing elit. event architecture expedita perspiciatis error, laborum ratione saepe repellendus distinctio quas voluptatem reiciendis dolore eos provident totam accusantium tempora, ducimus vitae explicabo.',
                    style: TextStyle(
                      color: Colors.grey[800],
                      //fontWeight: FontWeight,
                      fontSize: 17,
                    ),
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
