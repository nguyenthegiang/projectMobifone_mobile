//class để lưu trữ 1 data cho Chart của Card3 trong Home Page
import 'package:intl/intl.dart';

class Card2ChartData {
  final DateTime StartDate;
  final int KHCN;
  final int KHDN;
  final int TOTAL;

  Card2ChartData(this.StartDate, this.KHCN, this.KHDN, this.TOTAL);

  //In ra ngày theo Format dựa trên StartDate
  String getDate() {
    return DateFormat("dd MMM").format(StartDate);
  }
}
