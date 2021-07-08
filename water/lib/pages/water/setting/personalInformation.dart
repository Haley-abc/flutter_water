import 'package:flutter/material.dart';
import 'package:water/views/water/settingList.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '设置',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SettingList(),
    );
  }
}
