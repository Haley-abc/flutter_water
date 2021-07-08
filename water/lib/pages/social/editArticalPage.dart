import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'addFriendPage.dart';
import 'package:water/views/social/friendList.dart';

class EditArticaltPage extends StatefulWidget {
  const EditArticaltPage({Key? key}) : super(key: key);

  @override
  _EditArticaltPageState createState() => _EditArticaltPageState();
}

class _EditArticaltPageState extends State<EditArticaltPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_currentIndex),
      // ),
      appBar: AppBar(
        title: Text(
          '写动态',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  "发表",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            onTap: () {
              Fluttertoast.showToast(msg: '开发中！');
            },
          )
        ],
        centerTitle: true,
      ),
      body: builEditWidget(),
    );
  }
}

Widget builEditWidget() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 0, 10.0),
          child: Row(
        children: <Widget>[
          Container(
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
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Haley',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      )),
      Container(
        margin: EdgeInsets.all(15.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: '分享新鲜事...',
            border: InputBorder.none,
          ),
          maxLines: 6,
        ),
      )
      
    ],
  );
}
