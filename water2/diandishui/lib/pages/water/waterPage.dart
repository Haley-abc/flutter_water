import 'dart:math';

import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/pages/water/seetingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WaterPage extends StatefulWidget {
  const WaterPage({Key key}) : super(key: key);

  @override
  WaterPageState createState() {
    return WaterPageState();
  }
}

class WaterPageState extends State<WaterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(titleHeadPadding),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(GlobalData.head),
              ),
            ),
          ),
        ),
        title: Text(
          GlobalData.name,
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/setting.png"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: 60.0,
            alignment: Alignment.center,
            child: Text(
              '今日用水量  0.0 L',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.grey
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20.0),
              Column(
                children: [
                  Text("用",style: TextStyle(fontSize: 20.0),),
                  Text("水",style: TextStyle(fontSize: 20.0),),
                  Text("量",style: TextStyle(fontSize: 20.0),),
                  Text("对",style: TextStyle(fontSize: 20.0),),
                  Text("比",style: TextStyle(fontSize: 20.0),),
                ],
              ),
              SizedBox(width: 20.0,),
              Container(
                //折线图
                height: height/3,
                width: width-60,
                child: getBar(),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: [
              SizedBox(width: 20.0),
              Column(
                children: [
                  Text("我",style: TextStyle(fontSize: 20.0),),
                  Text("的",style: TextStyle(fontSize: 20.0),),
                  Text("用",style: TextStyle(fontSize: 20.0),),
                  Text("水",style: TextStyle(fontSize: 20.0),),
                  Text("结",style: TextStyle(fontSize: 20.0),),
                  Text("构",style: TextStyle(fontSize: 20.0),),
                ],
              ),
              SizedBox(width: 20.0,),
              Container(
                //折线图
                height: height/3,
                width: width-100,
                child: _Pie(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 11.0,
                        width: 11.0,
                        color: Color.fromARGB(255, 24, 52, 91),
                      ),
                      SizedBox(width: 2.0,),
                      Text("洗浴",style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        height: 11.0,
                        width: 11.0,
                        color: Color.fromARGB(255, 92, 115, 146),
                      ),
                      SizedBox(width: 2.0,),
                      Text("洗衣",style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        height: 11.0,
                        width: 11.0,
                        color: Color.fromARGB(255, 136, 170, 215),
                      ),
                      SizedBox(width: 2.0,),
                      Text("洗漱",style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        height: 11.0,
                        width: 11.0,
                        color: Color.fromARGB(255, 63, 139, 199),
                      ),
                      SizedBox(width: 2.0,),
                      Text("饮用",style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        height: 11.0,
                        width: 11.0,
                        color: Color.fromARGB(255, 62, 215, 220),
                      ),
                      SizedBox(width: 2.0,),
                      Text("冲厕",style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBar() {
    List<Barsales> dataBar = [
      new Barsales("个人用水量", 140.0,Color.fromARGB(255, 65, 106, 226)),
      new Barsales("区域人均用水量", 214.0,Color.fromARGB(255, 65, 106, 226)),
      new Barsales("个人用水", 200.0,Color.fromARGB(255, 65, 106, 226)),
    ];

    var seriesBar = [
      charts.Series(
        id: "Sales",
        data: dataBar,
        domainFn: (Barsales sales, _) => sales.day,
        measureFn: (Barsales sales, _) => sales.sale,
        labelAccessorFn: (Barsales row, _) => '${row.sale}',
        colorFn: (Barsales sales, _) =>   charts.ColorUtil.fromDartColor(sales.color),
      )
    ];
    return charts.BarChart(
      seriesBar,
      animate: true,
      barGroupingType: charts.BarGroupingType.stacked,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );
  }

  Widget _Pie() {

    var data = [
      PieSales("饮用", 30.0,Color.fromARGB(255, 63, 139, 199)),
      PieSales("冲厕", 14.0,Color.fromARGB(255, 62, 215, 220)),
      PieSales("洗浴", 25.0,Color.fromARGB(255, 24, 52, 91)),
      PieSales("洗衣", 19.0,Color.fromARGB(255, 92, 115, 146)),
      PieSales("洗漱", 12.0,Color.fromARGB(255, 136, 170, 215)),
    ];

    var seriesList = [
      charts.Series<PieSales, String>(
        id: 'Sales',
        domainFn: (PieSales sales, _) => sales.way,
        measureFn: (PieSales sales, _) => sales.num,
        colorFn: (PieSales sales, _) =>   charts.ColorUtil.fromDartColor(sales.color),
        data: data,
        labelAccessorFn: (PieSales row, _) => '${row.num}%',
      )
    ];

    return charts.PieChart(
        seriesList,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])
    );
  }

}

class Barsales {
  String day;
  double sale;
  Color color;

  Barsales(this.day, this.sale,this.color);
}

class PieSales {
  String way;
  double num;
  Color color;

  PieSales(this.way, this.num,this.color);
}