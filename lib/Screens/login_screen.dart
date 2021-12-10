import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Providers/user_dao.dart';
import 'package:project_mobifone_mobile/models/http_exception.dart';
import 'package:provider/provider.dart';

import '../Providers/user.dart';
import './home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  //Tạo Route cho Navigation
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Global Key để hỗ trợ interact với State của Form
  final _form = GlobalKey<FormState>();
  //Object User để lưu trữ thông tin của Form Submit
  var _user = User(username: '', password: '');
  /* Biến để lưu trữ xem chương trình có đang load ko (khi gửi http request);
  Nếu đang Load thì hiển thị màn hình loading */
  var _isLoading = false;
  // Biến để lưu giữ giá trị của phương thức đăng nhập
  var loginWithEmail = false;

  //function để show cái error message nếu có khi login / signup
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              //ấn nút này thì đóng dialog
            },
            child: Text('Okay'),
          ),
        ],
      ),
    );
  }

  //Method Submit Form
  Future<void> _saveForm() async {
    //Validate
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    //Dùng GlobalKey để Submit
    _form.currentState!.save();

    /* Chuyển màn hình sang trạng thái Loading để chờ send http requests xong
    mới chạy tiếp */
    setState(() {
      _isLoading = true;
    });

    //Login bằng Provider
    try {
      await Provider.of<UserDAO>(context, listen: false)
          .login(_user, loginWithEmail);

      //Navigate về home khi log in thành công
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } on HttpException catch (error) {
      //nếu là HttpException -> lỗi server -> xử lý riêng
      _showErrorDialog(error.toString());
    } catch (error) {
      //còn nếu lỗi khác thì thôi, xử lý chung 1 kiểu (VD như mất kết nối internet)
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    //Kết thúc trạng thái Loading
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Nếu chương trình đang load (đang gửi http request và chờ response)
      thì hiển thị màn hình Loading */
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.lightBlueAccent,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.5,
                    widthFactor: 0.5,
                    child: Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(200.0)),
                      color: const Color.fromRGBO(255, 255, 255, 0.4),
                      child: Container(
                        width: 400,
                        height: 400,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 400,
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Material(
                              elevation: 10.0,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/mobifone-logo.png",
                                  width: 80,
                                  height: 80,
                                ),
                              )),
                          Form(
                            //Link Form Widget với GlobalKey
                            key: _form,
                            child: Column(
                              children: [
                                //Input Field: Username
                                Container(
                                  width: 250,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.indigo,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0)),
                                          ),
                                          width: 200,
                                          height: 60,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            //Text Form Field
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Username",
                                                fillColor: Colors.white,
                                                filled: true,
                                              ),
                                              //Ấn Enter thì chuyển sang ô input tiếp theo
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              obscureText: false,
                                              enableSuggestions: false,
                                              autocorrect: false,

                                              //Khi save form: cập nhật username
                                              onSaved: (value) {
                                                _user = User(
                                                  username: value ?? '',
                                                  password: _user.password,
                                                );
                                              },

                                              //validate
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please provide a value.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                //Input Field: Password
                                Container(
                                  width: 250,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.indigo,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0)),
                                          ),
                                          width: 200,
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            //Text Form Field
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                fillColor: Colors.white,
                                                filled: true,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              obscureText: true,
                                              enableSuggestions: false,
                                              autocorrect: false,

                                              //Khi save form: cập nhật password
                                              onSaved: (value) {
                                                _user = User(
                                                  username: _user.username,
                                                  password: value ?? '',
                                                );
                                              },

                                              //validate
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please provide a value.';
                                                }
                                                return null;
                                              },

                                              //ấn Enter ở ô input cuối thì cx submit
                                              onFieldSubmitted: (_) {
                                                _saveForm();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //Checkbox: Phương thức đăng nhập
                                Container(
                                  width: 250,
                                  child: Center(
                                    child: CheckboxListTile(
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      title: const Text("Đăng nhập bằng Email"),
                                      value: loginWithEmail,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          loginWithEmail = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 150,
                            child: RaisedButton(
                              //ấn nút là submit form
                              onPressed: _saveForm,
                              color: Colors.indigo,
                              textColor: Colors.white,
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
