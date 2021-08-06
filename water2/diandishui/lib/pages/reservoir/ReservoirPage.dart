import 'package:diandishui/module/effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservoirPage extends StatefulWidget {
  const ReservoirPage({Key key}) : super(key: key);

  @override
  ReservoirPageState createState() {
    return ReservoirPageState();
  }
}

class ReservoirPageState extends State<ReservoirPage> {
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage("assets/icon/girl.png"),
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('1级水库',
                style: TextStyle(fontSize: 12.0, color: Colors.black),),
              Text('当前伤害值：50',
                style: TextStyle(fontSize: 12.0, color: Colors.black),),
            ],
          )
      ),
    );
  }
}