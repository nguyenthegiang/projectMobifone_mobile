import 'package:flutter/material.dart';

import '../Widget/lookup_display_screen_widgets/input_field.dart';
import '../Widget/lookup_display_screen_widgets/result_field.dart';
import '../Widget/screen_appbar.dart';
import '../Widget/app_drawer.dart';

//Màn hình hiển thị tra cứu
class LookUpDisplayScreen extends StatelessWidget {
  const LookUpDisplayScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/lookup-display';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 247),
      appBar: ScreenAppBar(),
      drawer: AppDrawer(),
      //Làm cho nó Scrollable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Title
              Container(
                height: 70,
                child: Card(
                  child: Center(
                    child: Text(
                      'Tra cứu số thuê bao',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 27, 197, 189),
                  elevation: 5,
                ),
              ),
              //Input Field
              InputField(),
              //Result Field
              ResultFied(),
            ],
          ),
        ),
      ),
    );
  }
}
