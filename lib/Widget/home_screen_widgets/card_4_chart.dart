import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Providers/home_screen_dao.dart';
import '../../models/card4_chart_data.dart';

//Tương tự Card1Chart nhưng cái này là SfCartesianChart thay vì SfCircularChart
class Card4Chart extends StatefulWidget {
  const Card4Chart({Key? key}) : super(key: key);

  @override
  _Card4ChartState createState() => _Card4ChartState();
}

class _Card4ChartState extends State<Card4Chart> {
  //chứa data source
  late List<Card4ChartData> _chartData;
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
                  SplineSeries<Card4ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (Card4ChartData cdata, _) => cdata.getDate(),
                    yValueMapper: (Card4ChartData cdata, _) => cdata.TOTAL,
                    name: 'Total',
                    //style
                    color: Color.fromARGB(255, 35, 158, 252),
                    width: 5,
                  ),
                  SplineSeries<Card4ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (Card4ChartData cdata, _) => cdata.getDate(),
                    yValueMapper: (Card4ChartData cdata, _) => cdata.TBTT,
                    name: 'TBTT',
                    //style
                    markerSettings: MarkerSettings(isVisible: true),
                    color: Color.fromARGB(255, 42, 232, 167),
                    width: 3,
                  ),
                  SplineSeries<Card4ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (Card4ChartData cdata, _) => cdata.getDate(),
                    yValueMapper: (Card4ChartData cdata, _) => cdata.TBTS,
                    name: 'TBTS',
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
  List<Card4ChartData> getChartData() {
    final List<Card4ChartData> chartData =
        Provider.of<HomeScreenDAO>(context).card4ChartData;

    return chartData;
  }
}
