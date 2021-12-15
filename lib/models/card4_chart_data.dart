//class để lưu trữ 1 data cho Chart của Card4 trong Home Page
import 'package:intl/intl.dart';

class Card4ChartData {
  final DateTime IssueDate;
  final int TBTT;
  final int TBTS;
  final int TOTAL;

  Card4ChartData(this.IssueDate, this.TBTT, this.TBTS, this.TOTAL);

  //In ra ngày theo Format dựa trên IssueDate
  String getDate() {
    return DateFormat("dd MMM").format(IssueDate);
  }
}
