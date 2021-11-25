import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Card5Chart extends StatefulWidget {
  const Card5Chart({Key? key}) : super(key: key);

  @override
  State<Card5Chart> createState() => _Card5ChartState();
}

class _Card5ChartState extends State<Card5Chart> {
  @override
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Jan', 35),
      _ChartData('Feb', 35),
      _ChartData('Mar', 30),
      _ChartData('Apr', 31),
      _ChartData('May', 33),
      _ChartData('Jun', 36),
      _ChartData('Jul', 39),
      _ChartData('Aug', 39),
      _ChartData('Sep', 42),
      _ChartData('Oct', 45),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          //Ẩn cái grid ở background
          isVisible: false,
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 45,
          interval: 10,
          //Ẩn cái grid ở background
          isVisible: false,
        ),
        borderColor: Colors.white,
        borderWidth: 0,
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          SplineAreaSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: 'Net Profit',
            color: Color.fromARGB(255, 225, 233, 254),
            //Sửa border -> hiển thị line
            borderDrawMode: BorderDrawMode.top,
            borderColor: Color.fromARGB(255, 117, 158, 250),
            borderWidth: 3,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
