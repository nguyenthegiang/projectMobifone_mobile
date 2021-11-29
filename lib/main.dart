import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_mobifone_mobile/Screens/news_list_screen.dart';
import 'package:provider/provider.dart';

import './Providers/user_dao.dart';
import './Screens/home_screen.dart';
import './Screens/login_screen.dart';
import './Screens/lookup_display_screen.dart';

void main() {
  //Chỉ cho phép hiển thị dọc
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserDAO(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mobifone App",
        //Chuyển tạm sang News Screen để Design đã
        home: NewsListScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          LookUpDisplayScreen.routeName: (ctx) => LookUpDisplayScreen(),
          NewsListScreen.routeName: (ctx) => NewsListScreen(),
        },
      ),
    );
  }
}
