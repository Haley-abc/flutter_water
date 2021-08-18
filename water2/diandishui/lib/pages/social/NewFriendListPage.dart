import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/effect.dart';
import 'package:flutter/material.dart';

class NewFriendList extends StatefulWidget {
  @override
  _NewFriendListState createState() {
    return _NewFriendListState();
  }
}

class _NewFriendListState extends State<NewFriendList> {
  List<FriendListModel> friendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadiusAll8(),
              boxShadow: [shadowOffsetY2()],
            ),
            margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: ListTile(
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
                GlobalData.name,
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoPage(user: friendList[index])));
              },
            ),
          );
        },
      );
  }
}
