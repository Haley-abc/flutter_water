import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:flutter/material.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FriendPage extends StatefulWidget {

  const FriendPage({Key key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {


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
          "好友",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(GlobalData.head),
                      ),
                    ),
                    width: 40.0,
                    height: 40.0,
                  ),
                  title: Text(
                    'ss',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: (){
                  },
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),

          );
        },
      ),
    );
  }

}