import 'package:flutter/material.dart';

//Widget chứa kết quả tra cứu trong LookUpDisplay Screen
class ResultFied extends StatelessWidget {
  const ResultFied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                      fontSize: 25,
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
                  TableCell(
                    child: Text('Tên khách hàng'),
                  ),
                  TableCell(
                    child: Text('Bùi Văn Quỳnh'),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Gói hiện tại'),
                  ),
                  TableCell(
                    child: Text('...'),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Lịch sử gói đăng ký'),
                  ),
                  TableCell(
                    child: Text('  '),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Xã Online gần nhất'),
                  ),
                  TableCell(
                    child: Text('   '),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Lưu lượng data 3 tháng gần nhất'),
                  ),
                  TableCell(
                    child: Text('50MB'),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lưu lượng thoại            |'),
                        Text('Ngoại mạng'),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Text('50 phút'),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lưu lượng thoại            |'),
                        Text('Nội mạng'),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Text('50 phút'),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Arpu bình quân'),
                  ),
                  TableCell(
                    child: Text('   '),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text('Arpu bình quân'),
                  ),
                  TableCell(
                    child: Text('   '),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 15),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  TableCell(
                    child: Text('Gói cước có thể tư vấn đăng ký'),
                  ),
                  TableCell(
                    child: Text('   '),
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
