import 'package:diandishui/module/effect.dart';
import 'package:diandishui/module/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  ServicePageState createState() {
    return ServicePageState();
  }
}

class ServicePageState extends State<ServicePage> {
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
                image: AssetImage("assets/icon/girl.png"),
              ),
            ),
          ),
        ),
        title: Text(
          '服务',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Text("社交"),
    );
  }
}