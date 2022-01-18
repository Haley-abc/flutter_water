import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/social/FriendListPage.dart';
import 'package:diandishui/pages/social/editArticalPage.dart';
import 'package:diandishui/pages/social/socialView/articleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key key}) : super(key: key);

  @override
  SocialPageState createState() {
    return SocialPageState();
  }
}

class SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(titleHeadPadding),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(GlobalData.head),
              ),
            ),
          ),
        ),
        title: Text(
          '社交',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditArticaltPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/add.png"),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FriendListPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/friends.png"),
            ),
          )
        ],
      ),
      body: ArticalList(),
    );
  }
}