import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Providers/lookup_dao.dart';
import 'package:provider/provider.dart';

//Widget chứa kết quả tra cứu trong LookUpDisplay Screen
class ResultFied extends StatefulWidget {
  const ResultFied({Key? key}) : super(key: key);

  @override
  State<ResultFied> createState() => _ResultFiedState();
}

class _ResultFiedState extends State<ResultFied> {
  @override
  Widget build(BuildContext context) {
    //Map dữ liệu lấy từ server để hiển thị
    final lookUpProvider = Provider.of<LookUpDAO>(context);

    return Container(
      //Nếu tìm đc dữ liệu thì hiển thị, ko thì thông báo
      child: lookUpProvider.isSuccess == false
          ? const Card(
              elevation: 0,
              child: Center(
                  child: Text(
                'SỐ ĐIỆN THOẠI KHÔNG CÓ TRONG DANH SÁCH',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              )),
            )
          : Card(
              elevation: 0,
              color: Colors.blueGrey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 255, 168, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Thông tin thuê bao',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Table
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    defaultColumnWidth: FractionColumnWidth(.7),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tên khách hàng',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lookUpProvider.phoneInfo['NAME'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Gói hiện tại',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lookUpProvider.phoneInfo['GOICUOC_HT'] ?? '',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lịch sử gói đăng ký',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '  ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Xã Online gần nhất',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lookUpProvider.phoneInfo['DIACHI_TRAM_VLR'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Doanh thu thông tin trung bình 2 tháng',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lookUpProvider.phoneInfo['DTTT_TB_2THANG'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lưu lượng thoại         |',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Ngoại mạng',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '50 phút',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lưu lượng thoại         |',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Nội mạng',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '50 phút',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Arpu bình quân',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '   ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Arpu bình quân',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lookUpProvider.phoneInfo['DTTT_TB_2THANG'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: 15),

                  Table(
                    border: TableBorder.all(
                      color: Color.fromARGB(255, 148, 198, 252),
                    ),
                    children: [
                      TableRow(children: [
                        Container(
                          color: Color.fromARGB(255, 199, 226, 255),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Gói cước có thể tư vấn đăng ký',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(255, 199, 226, 255),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              lookUpProvider.phoneInfo['CACGOI_DUOC_DK'],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
