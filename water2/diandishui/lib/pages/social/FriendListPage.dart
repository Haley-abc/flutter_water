import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/social/addFriendPage.dart';
import 'package:diandishui/pages/social/socialView/friendList.dart';
import 'package:flutter/material.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({Key key}) : super(key: key);

  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_currentIndex),
      // ),
      appBar: AppBar(
        title: Text(
          '好友',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFriendPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/add_friend.png"),
            ),
          ),
        ],
        centerTitle: true,
      ),
        body: FriendList(),
    );
  }
}