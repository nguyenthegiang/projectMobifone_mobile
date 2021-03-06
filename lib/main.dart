import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import './Screens/news_detail_screen.dart';
import './Screens/news_list_screen.dart';
import './Providers/user_dao.dart';
import './Screens/home_screen.dart';
import './Screens/login_screen.dart';
import './Screens/lookup_display_screen.dart';
import '../Providers/home_screen_dao.dart';
import '../Providers/lookup_dao.dart';
import '../Providers/news_dao.dart';

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
        /* Dùng ChangeNotifierProxyProvider thay vì ChangeNotifierProvider để có
        thể làm cho cái Provider này phụ thuộc vào 1 Provider khác...
        (xem thêm ở Shop App)*/
        ChangeNotifierProxyProvider<UserDAO, NewsDAO>(
          create: (_) => NewsDAO('', []),
          update: (ctx, userDAO, previousNews) => NewsDAO(
            userDAO.token,
            /* ở đây mình phải update để giữ lại List Product
            nhưng ở lần khởi chạy đầu tiên thì list null -> phải check null,
            nếu null thì return về list rỗng thôi */
            previousNews == null ? [] : previousNews.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LookUpDAO(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HomeScreenDAO(),
        ),
      ],
      child: Consumer<UserDAO>(
        /*Đặt consumer của UserDAO cho MaterialApp() -> mỗi khi có thay đổi trong
        UserDAO() (login, logout) thì MaterialApp() reload*/
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Mobifone App",
          //theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: const TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: const TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline6: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          /* Kiểm tra xem đã login chưa -> nếu rồi thì chuyển về Home */
          /* auto login: nếu chưa login thì thử gọi tryAutoLogin(), trong lúc đợi
          Future thì hiển thị màn hình chờ, đợi xong thì hiển thị AuthScreen()
          (ko cần check xem nó return true hay false, vì nếu nó auto login thành
          công thì nó sẽ gọi notifyListener() -> widget này sẽ tự rebuild, và
          khi nó check lại auth.isAuth thì sẽ return true -> về ProductsOverView) */
          home: auth.isAuth
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : LoginScreen(),
                ),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            LookUpDisplayScreen.routeName: (ctx) => LookUpDisplayScreen(),
            NewsListScreen.routeName: (ctx) => NewsListScreen(),
            NewsDetailScreen.routeName: (ctx) => NewsDetailScreen(),
          },
        ),
      ),
    );
  }
}
