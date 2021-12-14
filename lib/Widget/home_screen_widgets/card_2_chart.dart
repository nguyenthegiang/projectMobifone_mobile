import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Providers/home_screen_dao.dart';
import '../../models/card2_chart_data.dart';

//Tương tự Card4Chart
class Card2Chart extends StatefulWidget {
  const Card2Chart({Key? key}) : super(key: key);

  @override
  _Card2ChartState createState() => _Card2ChartState();
}

class _Card2ChartState extends State<Card2Chart> {
  //chứa data source
  late List<Card2ChartData> _chartData;
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
      Provider.of<HomeScreenDAO>(context).getcard2ChartData().then((_) {
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 500,
              width: 1000,
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
                    ColumnSeries<Card2ChartData, String>(
                      dataSource: _chartData,
                      xValueMapper: (Card2ChartData cdata, _) =>
                          cdata.getDate(),
                      yValueMapper: (Card2ChartData cdata, _) => cdata.TOTAL,
                      name: 'Total',
                      width: 0.5,
                      //style
                      color: Color.fromARGB(255, 41, 160, 249),
                    ),
                    SplineSeries<Card2ChartData, String>(
                      dataSource: _chartData,
                      xValueMapper: (Card2ChartData cdata, _) =>
                          cdata.getDate(),
                      yValueMapper: (Card2ChartData cdata, _) => cdata.KHCN,
                      name: 'KHCN',
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        shape: DataMarkerType.rectangle,
                      ),
                      //style
                      color: Color.fromARGB(255, 9, 225, 155),
                      width: 5,
                    ),
                    SplineSeries<Card2ChartData, String>(
                      dataSource: _chartData,
                      xValueMapper: (Card2ChartData cdata, _) =>
                          cdata.getDate(),
                      yValueMapper: (Card2ChartData cdata, _) => cdata.KHDN,
                      name: 'KHDN',
                      //style
                      color: Color.fromARGB(255, 155, 124, 250),
                      width: 3,
                    ),
                  ],
                  primaryXAxis: CategoryAxis(),
                ),
              ),
            ),
    );
  }

  //tạo datasource
  List<Card2ChartData> getChartData() {
    final List<Card2ChartData> chartData =
        Provider.of<HomeScreenDAO>(context).card2ChartData;

    return chartData;
  }
}
