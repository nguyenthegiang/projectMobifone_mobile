import 'package:flutter/material.dart';

import '../../Screens/news_detail_screen.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              //Hero Widget để làm Animation Transition khi navigate giữa 2 page
              child: Hero(
                tag:
                    'https://iem.hcmiu.edu.vn/wp-content/uploads/2020/11/book.jpg',
                child: Image.network(
                  'https://iem.hcmiu.edu.vn/wp-content/uploads/2020/11/book.jpg',
                  fit: BoxFit.cover,
                  height: 70.0,
                  width: 70.0,
                ),
              ),
            ),
            title: Text('TestTesttest',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: Text('11/11/2011'),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade100],
                begin: Alignment.centerRight,
                end: new Alignment(-1.0, -1.0)),
          ),
        ),
        onTap: () {
          //Chuyển sang News Detail Screen
          Navigator.of(context).pushNamed(NewsDetailScreen.routeName);
        },
      ),
    );
  }
}
