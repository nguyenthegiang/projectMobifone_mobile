import 'package:flutter/material.dart';

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
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(
                colors: [Color(0xffEE9CA7), Color(0xffFFDDE1)],
                begin: Alignment.centerRight,
                end: new Alignment(-1.0, -1.0)),
          ),
        ),
        onTap: () {
          //
        },
      ),
    );
  }
}
