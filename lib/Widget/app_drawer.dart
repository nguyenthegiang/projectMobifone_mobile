import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Providers/user_dao.dart';
import 'package:project_mobifone_mobile/Screens/lookup_display_screen.dart';
import 'package:project_mobifone_mobile/Screens/news_list_screen.dart';

import 'package:provider/provider.dart';
import '../Screens/home_screen.dart';

//Drawer để chuyển giữa các page
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'MOBIFONE',
              style: Theme.of(context).textTheme.headline6,
            ),
            automaticallyImplyLeading: false,
            /*Dòng này để nó ko bao h thêm cái nút quay lại (vì nó là AppBar) vì
            nút quay lại sẽ ko hoạt động đc ở đây*/
          ),

          const Divider(), //1 cái dòng như <hr>
          ListTile(
            //Ấn vào cái này để quay về Home Page
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),

          const Divider(),
          ListTile(
            //Ấn vào cái này để đến Order Screen
            leading: const Icon(Icons.search),
            title: const Text('Màn hình tra cứu'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(LookUpDisplayScreen.routeName);
            },
          ),

          const Divider(),
          ListTile(
            //Ấn vào cái này để đến Manage Product Screen
            leading: const Icon(Icons.now_wallpaper),
            title: const Text('News'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(NewsListScreen.routeName);
            },
          ),

          const Divider(),
          ListTile(
            //Ấn vào cái này để đến Logout
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              /*trg khi logout thì phải tắt drawer đi ko nó sẽ lỗi
              (video thì lỗi thôi chứ code của mình cx chả lỗi)*/
              Navigator.of(context).pop();
              //chuyển về home route trc khi logout, để tránh bị mấy lỗi linh tinh
              Navigator.of(context).pushReplacementNamed('/');
              //gọi đến logout của auth.dart
              Provider.of<UserDAO>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
