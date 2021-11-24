import 'package:flutter/material.dart';
//Dùng thư viện để vẽ Chart
import 'package:syncfusion_flutter_charts/charts.dart';

//Radial Bar Chart
class Card1Chart extends StatefulWidget {
  @override
  State<Card1Chart> createState() => _Card1ChartState();
}

class _Card1ChartState extends State<Card1Chart> {
  //list để chứa data cho chart
  late List<ChartData> _chartData;
  //tooltip cho chart: nhấn vào chart thì hiển thị
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    //tạo data source
    _chartData = getChartData();
    //tạo tooltip
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SafeArea(
        child: SfCircularChart(
          //tên chart
          title: ChartTitle(text: 'This is Chart Title'),
          //chú thích
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          //tooltip
          tooltipBehavior: _tooltipBehavior,
          //Loại chart
          series: <CircularSeries>[
            RadialBarSeries<ChartData, String>(
              //data source
              dataSource: _chartData,
              //tên thuộc tính
              xValueMapper: (ChartData data, _) => data.dataName,
              //value của thuộc tính
              yValueMapper: (ChartData data, _) => data.dataValue,
              //thêm label cho các data
              dataLabelSettings: DataLabelSettings(isVisible: true),
              //cho phép hiển thị tooltip
              enableTooltip: true,
              //maximum value: giá trị tối đa để dựa vào đó các cột hiển thị
              maximumValue: 100,
            )
          ],
        ),
      ),
    );
  }

  /*Tạo 1 DataSource cho Chart = List các Data 
  (Dummy Data)*/
  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData('data1', 45),
      ChartData('data2', 55),
      ChartData('data3', 70),
      ChartData('data4', 85),
    ];

    return chartData;
  }
}

//Class chứa Data cho Chart
class ChartData {
  final String dataName;
  final int dataValue;

  ChartData(this.dataName, this.dataValue);
}
