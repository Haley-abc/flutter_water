import 'package:diandishui/module/text.dart';
import 'package:flutter/material.dart';

class RepairPage extends StatefulWidget {
  const RepairPage({Key key}) : super(key: key);

  @override
  _RepairPageState createState() {
    return _RepairPageState();
  }
}

class _RepairPageState extends State<RepairPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '报修服务',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('暂未开放'),
      ),
    );
  }
}
