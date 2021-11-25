import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//Tương tự Card4Chart
class Card2Chart extends StatefulWidget {
  const Card2Chart({Key? key}) : super(key: key);

  @override
  _Card2ChartState createState() => _Card2ChartState();
}

class _Card2ChartState extends State<Card2Chart> {
  //chứa data source
  late List<ChartData> _chartData;
  //tooltip
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SafeArea(
        child: SfCartesianChart(
          title: ChartTitle(
            text: 'VLR Công ty 4',
            alignment: ChartAlignment.near,
          ),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            ColumnSeries<ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (ChartData cdata, _) => cdata.dataName,
              yValueMapper: (ChartData cdata, _) => cdata.websiteBlog,
              name: 'Website Blog',
            ),
            SplineSeries<ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (ChartData cdata, _) => cdata.dataName,
              yValueMapper: (ChartData cdata, _) => cdata.socialMedia,
              name: 'Social Media',
              markerSettings: MarkerSettings(
                isVisible: true,
                shape: DataMarkerType.rectangle,
              ),
            ),
            SplineSeries<ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (ChartData cdata, _) => cdata.dataName,
              yValueMapper: (ChartData cdata, _) => cdata.Them1,
              name: 'Theme 1',
            ),
          ],
          primaryXAxis: CategoryAxis(),
        ),
      ),
    );
  }

  //tạo datasource
  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData('01 Jan', 25, 23, 0),
      ChartData('02 Jan', 30, 42, 3),
      ChartData('03 Jan', 27, 35, 5),
      ChartData('04 Jan', 44, 27, 8),
      ChartData('05 Jan', 11, 43, 10),
      ChartData('06 Jan', 22, 22, 12),
      ChartData('07 Jan', 12, 17, 15),
      ChartData('08 Jan', 21, 31, 20),
      ChartData('09 Jan', 47, 22, 23),
      ChartData('10 Jan', 23, 22, 30),
      ChartData('11 Jan', 11, 12, 50),
    ];

    return chartData;
  }
}

//Class chứa Data cho Chart
class ChartData {
  final String dataName;
  final num websiteBlog;
  final num socialMedia;
  final num Them1;

  ChartData(
    this.dataName,
    this.websiteBlog,
    this.socialMedia,
    this.Them1,
  );
}
