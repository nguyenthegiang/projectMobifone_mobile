import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/lookup_dao.dart';
import '../../models/http_exception.dart';

//Widget chứa field input để thực hiện tra cứu
class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  //Global Key để hỗ trợ interact với State của Form
  final _form = GlobalKey<FormState>();
  //biến để lưu giữ giá trị của input trong form
  String phoneNum = '';
  /* Biến để lưu trữ xem chương trình có đang load ko (khi gửi http request);
  Nếu đang Load thì hiển thị màn hình loading */
  var _isLoading = false;

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
      await Provider.of<LookUpDAO>(context, listen: false).lookUp(phoneNum);

      //Navigate về home khi log in thành công
      //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } on HttpException catch (error) {
      //nếu là HttpException -> lỗi server -> xử lý riêng
      //_showErrorDialog(error.toString());
    } catch (error) {
      //còn nếu lỗi khác thì thôi, xử lý chung 1 kiểu (VD như mất kết nối internet)
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      //_showErrorDialog(errorMessage);
    }

    //Kết thúc trạng thái Loading
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              const Text(
                'Nhập số',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    //Link Form Widget với GlobalKey
                    key: _form,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 200,
                      //Input field
                      child: TextFormField(
                        //chỉ nhập số
                        keyboardType: TextInputType.number,
                        //style
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Ví dụ 9xxxxx',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //background color
                          fillColor: Color.fromARGB(255, 243, 246, 249),
                          filled: true,
                        ),
                        //Khi save form: cập nhật phoneNum
                        onSaved: (value) {
                          phoneNum = value!;
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //Submit button
                    child: ElevatedButton(
                      child: Text(
                        'Tra cứu',
                        style: TextStyle(fontSize: 17),
                      ),
                      //ấn nút là submit form
                      onPressed: _saveForm,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 168, 0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
