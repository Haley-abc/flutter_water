import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/pages/social/UserInfo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() {
    return _FriendListState();
  }
}

class _FriendListState extends State<FriendList> {
  List<FriendListModel> friendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        initData();
      });
    });
  }

  Future<void> initData() async {
    HttpRequest.request("$BASE_URL/friend/selectFriend",
        method: "get",
        params: {
          "userId": GlobalData.id,
        }).then((value) {
      if (value.data["code"] == 200) {
        List<FriendListModel> friendList2 = [];
        List<dynamic> result = value.data["result"];
        for (var i = 0; i < result.length; i++) {
          FriendListModel friendListModel = FriendListModel.formMap(result[i]);
          friendList2.add(friendListModel);
        }
        setState(() {
          friendList = friendList2;
        });
      } else {
        print("获取好友列表失败");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (friendList.isEmpty || friendList == null) {
      return
        RefreshIndicator(
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 30.0),
            child: Text("暂无好友"),
        ),
        onRefresh: _handleRefresh,
      );
    } else {
      return
        RefreshIndicator(
          child: ListView.builder(
            itemCount: friendList.length,
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
                        image: AssetImage(friendList[index].head),
                      ),
                    ),
                    width: 40.0,
                    height: 40.0,
                  ),
                  title: Text(
                    friendList[index].name,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoPage(user: friendList[index])));
                  },
                ),
              );
            },
          ),
          onRefresh: _handleRefresh,
        );
    }
  }
}
