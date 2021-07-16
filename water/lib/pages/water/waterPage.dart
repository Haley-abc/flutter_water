import 'package:flutter/material.dart';
import 'package:water/ui/data.dart';
import 'package:water/ui/word.dart';
import 'setting/settingPage.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  _WaterPageState createState() {
    return _WaterPageState();
  }
}

class _WaterPageState extends State<WaterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(HEADPADDING),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Global.head),
              ),
            ),
          ),
        ),
        title: Text(
            Global.name,
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
        ],
      ),
    );
  }
}
