import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:flutter/material.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AwardsPage extends StatefulWidget {

  const AwardsPage({Key key}) : super(key: key);

  @override
  _AwardsPageState createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {


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
          "成就",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: buildGridView()
    );
  }

  List<Container> _buildList(int count){
    return List<Container>.generate(count, (i) => Container(
      child: Column(
        children: [
          IconButton(
            iconSize: 60,
            onPressed: () {

            },
            icon: Image(
              image: AssetImage("assets/icon/gold_medal.png"),
            ),
          ),
          Text("节水小能手")
        ],
      ),
    ));
  }

  Widget buildGridView(){
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.only(left: 10,top: 10,right: 10),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildList(8),
    );
  }
}