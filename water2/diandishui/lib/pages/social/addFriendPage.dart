import 'package:diandishui/module/color.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/social/socialView/friendList.dart';
import 'package:diandishui/pages/social/socialView/new_friends.dart';
import 'package:diandishui/pages/social/socialView/search_friends.dart';
import 'package:flutter/material.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key key}) : super(key: key);

  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_currentIndex),
      // ),
      appBar: AppBar(
        title: Text(
          '找人',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                child: Container(
                  color: greyF3F3F3,
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text("查找好友"),
                  ),
                ),
                onTap: () {
                  _onItemTapped(0);
                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  color: greyF3F3F3,
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text("新的朋友"),
                  ),
                ),
                onTap: () {
                  _onItemTapped(1);
                },
              )),
            ],
          ),
          IndexedStack(
            index: _currentIndex,
            children: [
              NewFriendsPage(),
              SearchFriendsPage(),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
