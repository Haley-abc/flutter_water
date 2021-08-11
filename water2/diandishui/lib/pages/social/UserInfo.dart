import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/social/socialView/friendList.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {

  final FriendListModel user;

  const UserInfoPage({Key key,@required this.user}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFriendPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/white_dots.png"),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            width: width,
            height: height/5,
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.user.head),
                    ),
                  ),
                  width: height/5-60,
                  height: height/5-60,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  widget.user.name,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}