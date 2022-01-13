import 'package:diandishui/pages/social/socialView/add_friend_list.dart';
import 'package:flutter/material.dart';

class SearchFriendsPage extends StatefulWidget {
  @override
  _SearchFriendsPageState createState() {
    return _SearchFriendsPageState();
  }
}

class _SearchFriendsPageState extends State<SearchFriendsPage> {
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height-140;
    return Container(
      height: height1,
      child: AddFriendList()
    );
  }
}
