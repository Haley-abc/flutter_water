import 'package:flutter/material.dart';
import 'package:water/ui/word.dart';
import 'addFriendPage.dart';
import 'package:water/views/social/friendList.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({Key? key}) : super(key: key);

  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  int _currentIndex = 0;

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
            fontSize: APPBARTITLE,
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