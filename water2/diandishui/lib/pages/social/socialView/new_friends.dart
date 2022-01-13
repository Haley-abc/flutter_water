import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/pages/social/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:diandishui/module/effect.dart';

class NewFriendsPage extends StatefulWidget {
  @override
  _NewFriendsPageState createState() {
    return _NewFriendsPageState();
  }
}

class _NewFriendsPageState extends State<NewFriendsPage> {

  //搜索好友列表
  List<FriendListModel> friendList = [];

  //用户名输入框的焦点控制
  FocusNode _phoneFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController _phoneController = new TextEditingController();

  Future<void> searchFriend() async {
    HttpRequest.request("$BASE_URL/friend/searchFriend",
        method: "get",
        params: {
          "phone": _phoneController.text,
        }).then((value) {
      if (value.data["code"] == 200) {
        FriendListModel friend = new FriendListModel();
        friend.id = value.data["result"]["id"];
        friend.name = value.data["result"]["name"];
        friend.head = value.data["result"]["head"];
        setState(() {
          friendList.clear();
          friendList.add(friend);
        });
      } else {
        setState(() {
          Fluttertoast.showToast(msg: '账号不存在！');
          friendList.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height-140;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              Expanded(
                  child: TextField(
                    focusNode: _phoneFocusNode,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText:'请输入手机号',
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                width: 50.0,
                child: InkWell(child: Text('查找'),onTap: (){
                  if(_phoneController.text.isEmpty){
                    Fluttertoast.showToast(msg: '手机号不能为空！');
                  }else{
                    searchFriend();
                  }
                },),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: height1-50.0,
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
          ),
        ],
      ),
    );
  }
}
