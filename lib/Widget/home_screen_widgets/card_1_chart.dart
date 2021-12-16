import 'package:flutter/material.dart';
import 'package:project_mobifone_mobile/Providers/home_screen_dao.dart';
import 'package:project_mobifone_mobile/models/card1_chart_data.dart';
import 'package:provider/provider.dart';
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
      Provider.of<HomeScreenDAO>(context).getcard1ChartData().then((_) {
        setState(() {
          //chuyển màn hình lại bình thường sau khi lấy data xong
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    //tạo data source
    _chartData = getChartData();
    //tạo tooltip
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
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
              child: SfCircularChart(
                //tên chart
                //title: ChartTitle(text: 'This is Chart Title'),
                //chú thích
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                ),
                //tooltip
                tooltipBehavior: _tooltipBehavior,
                //list các color cho chart
                palette: <Color>[
                  Color.fromARGB(255, 255, 91, 122),
                  Color.fromARGB(255, 255, 181, 48),
                  Color.fromARGB(255, 26, 178, 126),
                  Color.fromARGB(255, 35, 158, 252),
                ],
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
                    //Màu nền của column chart
                    trackColor: Color.fromARGB(255, 241, 243, 242),
                  )
                ],
              ),
            ),
    );
  }

  /*Data*/
  List<ChartData> getChartData() {
    //connect to Provider
    final Card1ChartData card1ChartData =
        Provider.of<HomeScreenDAO>(context).card1ChartData;

    //add to chart data
    final List<ChartData> chartData = [
      ChartData('VLR', card1ChartData.VLR),
      ChartData('DTTT', card1ChartData.DTTT),
      ChartData('PTM', card1ChartData.PTM),
    ];

    return chartData;
  }
}

//Class chứa Data cho Chart
class ChartData {
  final String dataName;
  final double dataValue;

  ChartData(this.dataName, this.dataValue);
}
