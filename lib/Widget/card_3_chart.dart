import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//Tương tự như Card1Chart
class Card3Chart extends StatefulWidget {
  const Card3Chart({
    Key? key,
  }) : super(key: key);

  @override
  State<Card3Chart> createState() => _Card3ChartState();
}

class _Card3ChartState extends State<Card3Chart> {
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
          title: ChartTitle(text: 'Gradient Donut with custom Start-angle'),
          //chú thích
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          //tooltip
          tooltipBehavior: _tooltipBehavior,
          //Loại chart
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
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
      ChartData('series 1', 44),
      ChartData('series 2', 55),
      ChartData('series 3', 41),
      ChartData('series 4', 17),
      ChartData('series 5', 15),
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
