import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Providers/home_screen_dao.dart';

//Tương tự Card1Chart nhưng cái này là SfCartesianChart thay vì SfCircularChart
class Card4Chart extends StatefulWidget {
  const Card4Chart({Key? key}) : super(key: key);

  @override
  _Card4ChartState createState() => _Card4ChartState();
}

class _Card4ChartState extends State<Card4Chart> {
  //chứa data source
  late List<ChartData> _chartData;
  //tooltip
  late TooltipBehavior _tooltipBehavior;
  //Biến để cho didChangeDependencies() chỉ chạy 1 lần thôi
  var _isInit = true;
  //biến để làm loading spinner
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    /* Khi mới vào thì load List Data cho Chart từ Web Server về*/
    if (_isInit) {
      setState(() {
        //chuyển màn hình sang loading
        _isLoading = true;
      });
      Provider.of<HomeScreenDAO>(context).getcard4ChartData().then((_) {
        setState(() {
          //chuyển màn hình lại bình thường sau khi lấy data xong
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SfCartesianChart(
                title: ChartTitle(
                  text: 'Page Statistics',
                  alignment: ChartAlignment.near,
                ),
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  SplineSeries<ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartData cdata, _) => cdata.dataName,
                    yValueMapper: (ChartData cdata, _) => cdata.sessionDuration,
                    name: 'Session Duration',
                    //style
                    color: Color.fromARGB(255, 35, 158, 252),
                    width: 5,
                  ),
                  SplineSeries<ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartData cdata, _) => cdata.dataName,
                    yValueMapper: (ChartData cdata, _) => cdata.pageViews,
                    name: 'Page Views',
                    //style
                    markerSettings: MarkerSettings(isVisible: true),
                    color: Color.fromARGB(255, 42, 232, 167),
                    width: 3,
                  ),
                  SplineSeries<ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartData cdata, _) => cdata.dataName,
                    yValueMapper: (ChartData cdata, _) => cdata.totalVisits,
                    name: 'Total Visits',
                    //style
                    markerSettings: MarkerSettings(isVisible: true),
                    color: Color.fromARGB(255, 255, 181, 48),
                    width: 3,
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
      ChartData('01 Jan', 39, 40, 81),
      ChartData('02 Jan', 40, 45, 45),
      ChartData('03 Jan', 45, 25, 90),
      ChartData('04 Jan', 41, 20, 100),
      ChartData('05 Jan', 19, 30, 55),
      ChartData('06 Jan', 20, 24, 39),
      ChartData('07 Jan', 21, 20, 63),
      ChartData('08 Jan', 25, 23, 61),
      ChartData('09 Jan', 29, 20, 82),
      ChartData('10 Jan', 59, 4, 57),
      ChartData('11 Jan', 29, 15, 50),
    ];

    return chartData;
  }
}

//Class chứa Data cho Chart
class ChartData {
  final String dataName;
  final num sessionDuration;
  final num pageViews;
  final num totalVisits;

  ChartData(
    this.dataName,
    this.sessionDuration,
    this.pageViews,
    this.totalVisits,
  );
}
