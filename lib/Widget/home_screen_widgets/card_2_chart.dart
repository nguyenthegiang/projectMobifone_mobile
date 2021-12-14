import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Providers/home_screen_dao.dart';

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
              //style
              color: Color.fromARGB(255, 41, 160, 249),
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
              //style
              color: Color.fromARGB(255, 9, 225, 155),
              width: 5,
            ),
            SplineSeries<ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (ChartData cdata, _) => cdata.dataName,
              yValueMapper: (ChartData cdata, _) => cdata.them1,
              name: 'Theme 1',
              //style
              color: Color.fromARGB(255, 155, 124, 250),
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
  final num them1;

  ChartData(
    this.dataName,
    this.websiteBlog,
    this.socialMedia,
    this.them1,
  );
}
