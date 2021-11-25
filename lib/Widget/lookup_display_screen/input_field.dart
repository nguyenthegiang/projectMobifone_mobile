import 'package:flutter/material.dart';

//Widget chứa field input để thực hiện tra cứu
class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                'Nhập số',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
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
                      onPressed: () {},
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
