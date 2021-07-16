import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/pages/social/editArticalPage.dart';
import 'package:water/ui/data.dart';
import 'package:water/ui/word.dart';
import 'FriendListPage.dart';
import 'package:water/views/social/articleList.dart';

class SocialContactPage extends StatefulWidget {
  const SocialContactPage({Key? key}) : super(key: key);

  @override
  _SocialContactPageState createState() {
    return _SocialContactPageState();
  }
}

class _SocialContactPageState extends State<SocialContactPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(HEADPADDING),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Global.head),
              ),
            ),
          ),
        ),
        title: Text(
          '社交',
          style: TextStyle(
            fontSize: APPBARTITLE,
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
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: ArticalList(),
      )
    );
  }
}
