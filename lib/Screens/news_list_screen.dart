import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/news_dao.dart';
import '../Widget/news_screen_widgets/news_list.dart';
import '../Widget/screen_appbar.dart';

//Màn hình hiển thị tra cứu
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/news';

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  //Biến để cho didChangeDependencies() chỉ chạy 1 lần thôi
  var _isInit = true;
  //biến để làm loading spinner
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    /* Khi mới vào news_list_screen thì load List News từ Web Server về*/
    if (_isInit) {
      setState(() {
        //chuyển màn hình sang loading
        _isLoading = true;
      });

      Provider.of<NewsDAO>(context).fetchNews().then((_) {
        setState(() {
          //chuyển màn hình lại bình thường sau khi lấy data xong
          _isLoading = false;
        });
      });
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      //Nếu đang load thì hiển thị loading spinner
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          //Làm cho nó Scrollable
          : SingleChildScrollView(
              child: Container(
                height: 900,
                child: NewsList(),
              ),
            ),
    );
  }
}
