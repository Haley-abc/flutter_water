import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() {
    return _FriendListState();
  }
}

class _FriendListState extends State<FriendList>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context,index){
        if(index.isOdd){
          return Divider();
        }
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/head2.png'),
              ),
            ),
            width: 40.0,
            height: 40.0,
          ),
          title: Text(
              '用户$index',
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
        );
      },
    );
  }
}
