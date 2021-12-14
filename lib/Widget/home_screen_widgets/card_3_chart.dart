import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Providers/home_screen_dao.dart';

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
  //Biến để cho didChangeDependencies() chỉ chạy 1 lần thôi
  var _isInit = true;
  //biến để làm loading spinner
  var _isLoading = false;

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
  void didChangeDependencies() {
    /* Khi mới vào thì load List Data cho Chart từ Web Server về*/
    if (_isInit) {
      setState(() {
        //chuyển màn hình sang loading
        _isLoading = true;
      });
      Provider.of<HomeScreenDAO>(context).getcard3ChartData().then((_) {
        setState(() {
          //chuyển màn hình lại bình thường sau khi lấy data xong
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      //Nếu đang load thì hiển thị loading spinner
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SfCircularChart(
                //tên chart
                title:
                    ChartTitle(text: 'Gradient Donut with custom Start-angle'),
                //chú thích
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                //tooltip
                tooltipBehavior: _tooltipBehavior,
                //Style: màu chart
                palette: [
                  Color.fromARGB(255, 255, 91, 122),
                  Color.fromARGB(255, 255, 181, 48),
                  Color.fromARGB(255, 26, 178, 126),
                  Color.fromARGB(255, 35, 158, 252),
                  Color.fromARGB(255, 119, 94, 211),
                ],

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
  (Lấy từ Server)*/
  List<ChartData> getChartData() {
    //Lấy list data từ Server
    final card3ChardData = Provider.of<HomeScreenDAO>(context).card3ChartData;

    //gán vào list data ở đây
    final List<ChartData> chartData = [];
    card3ChardData.forEach((element) {
      chartData.add(ChartData(element.ProvinceCode, element.DTTKC));
    });

    return chartData;
  }
}

//Class chứa Data cho Chart
class ChartData {
  final String dataName;
  final double dataValue;

  ChartData(this.dataName, this.dataValue);
}
