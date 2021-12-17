import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class Card7 extends StatefulWidget {
  const Card7({
    Key? key,
  }) : super(key: key);

  @override
  State<Card7> createState() => _Card7State();
}

class _Card7State extends State<Card7> {
  late List<SocialMediaUsers> _treemapData;
  late List<TreemapColorMapper> _colorMappers;

  @override
  void initState() {
    _treemapData = getTreeMapData();

    //tạo color
    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.value(value: 'Facebook', color: Colors.blue[200]!),
      TreemapColorMapper.value(value: 'Instagram', color: Colors.deepOrange),
      TreemapColorMapper.value(value: 'Twitter', color: Colors.blue[800]!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            //Title
            Center(
              child: Text(
                'This is the title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            //Chart
            Padding(
              padding: const EdgeInsets.all(3),
              child: SafeArea(
                child: SfTreemap(
                  dataCount: _treemapData.length,
                  levels: [
                    TreemapLevel(
                      groupMapper: (int index) {
                        return _treemapData[index].country;
                      },
                      //tạo label
                      labelBuilder: (BuildContext context, TreemapTile tile) {
                        return Padding(
                          padding: EdgeInsets.all(2.5),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(tile.group),
                          ),
                        );
                      },
                      //tạo tooltip
                      tooltipBuilder: (BuildContext context, TreemapTile tile) {
                        return Padding(
                          padding: EdgeInsets.all(2.5),
                          child: Text(
                            'Country: ${tile.group}\nSocialmedia: ${tile.weight}M',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                      //tạo color
                      colorValueMapper: (TreemapTile tile) {
                        return _treemapData[tile.indices[0]].socialMedia;
                      },
                    )
                  ],
                  //tạo color
                  colorMappers: _colorMappers,
                  weightValueMapper: (int index) {
                    return _treemapData[index].usersInMillions;
                  },
                  //tạo legend
                  legend: TreemapLegend(
                    position: TreemapLegendPosition.bottom,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //data source
  List<SocialMediaUsers> getTreeMapData() {
    return <SocialMediaUsers>[
      SocialMediaUsers('India', 'Facebook', 25.4),
      SocialMediaUsers('USA', 'Instagram', 19.11),
      SocialMediaUsers('Japan', 'Facebook', 13.3),
      SocialMediaUsers('Getmany', 'Instagram', 10.65),
      SocialMediaUsers('France', 'Twitter', 7.54),
      SocialMediaUsers('UK', 'Instagram', 4.93),
    ];
  }
}

//data source
class SocialMediaUsers {
  final String country;
  final String socialMedia;
  final double usersInMillions;

  SocialMediaUsers(this.country, this.socialMedia, this.usersInMillions);
}
