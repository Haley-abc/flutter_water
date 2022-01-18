import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:flutter/material.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BagPage extends StatefulWidget {

  const BagPage({Key key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "背包",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Text("hh")
    );
  }

}