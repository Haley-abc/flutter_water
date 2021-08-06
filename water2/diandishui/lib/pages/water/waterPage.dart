import 'package:diandishui/global/globalData.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/utils/storage_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key key}) : super(key: key);

  @override
  WaterPageState createState() {
    return WaterPageState();
  }
}

class WaterPageState extends State<WaterPage> {

  String name;
  String head;

  @override
  void initState() {
    super.initState();
    name = GlobalData.name;
    head = GlobalData.head;
  }

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
                image: AssetImage(head),
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
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
        ],
      ),
    );
  }
}