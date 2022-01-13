import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/addFriendListModel.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFriendList extends StatefulWidget {
  @override
  _AddFriendListState createState() {
    return _AddFriendListState();
  }
}

class _AddFriendListState extends State<AddFriendList> {
  List<AddFriendListModel> addFriendList = [];

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
    HttpRequest.request("$BASE_URL/addFriend/getAddFriendList",
        method: "get",
        params: {
          "userId": GlobalData.id,
        }).then((value) {
      if (value.data["code"] == 200) {
        List<AddFriendListModel> addFriendList2 = [];
        List<dynamic> result = value.data["result"];
        for (var i = 0; i < result.length; i++) {
          AddFriendListModel addFriendListModel = AddFriendListModel.formMap(result[i]);
          addFriendList2.add(addFriendListModel);
        }
        setState(() {
          addFriendList = addFriendList2;
        });
      } else {
        print("获取好友列表失败");
      }
    });
  }

  Future<void> addFriend(int friendId) async {
    HttpRequest.request("$BASE_URL/friend/addFriend",
        method: "post",
        data: {"userId":GlobalData.id,"friendId": friendId}).then((value) {
      if (value.data["code"] == 200) {
        Fluttertoast.showToast(msg: value.data["message"]);
        setState(() {
          initData();
        });
      } else {
        Fluttertoast.showToast(msg: value.data["message"]);
      }
    });
  }

  Future<void> refuseAddFriend(int friendId) async {
    HttpRequest.request("$BASE_URL/friend/refuseAddFriend",
        method: "post",
        data: {"userId":GlobalData.id,"friendId": friendId}).then((value) {
      if (value.data["code"] == 200) {
        Fluttertoast.showToast(msg: value.data["message"]);
        setState(() {
          initData();
        });
      } else {
        Fluttertoast.showToast(msg: value.data["拒绝失败"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (addFriendList.isEmpty || addFriendList == null) {
      return
        RefreshIndicator(
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 30.0),
            child: Text("暂无好友添加请求"),
        ),
        onRefresh: _handleRefresh,
      );
    } else {
      return
        RefreshIndicator(
          child: ListView.builder(
            itemCount: addFriendList.length,
            itemBuilder: (context, index) {
              if(addFriendList[index].state==0){
                return buildWaitItem(addFriendList[index]);
              }else if(addFriendList[index].state==1){
                return buildAgreeItem(addFriendList[index]);
              }else{
                return buildDisagreeItem(addFriendList[index]);
              }
            },
          ),
          onRefresh: _handleRefresh,
        );
    }
  }

  Widget buildAgreeItem(AddFriendListModel addFriendListModel) {
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
              image: AssetImage(addFriendListModel.head),
            ),
          ),
          width: 40.0,
          height: 40.0,
        ),
        title: Text(
          addFriendListModel.name,
          style: TextStyle(fontSize: 16.0),
        ),
        trailing: Text('已添加'),
        onTap: (){

        },
      ),
    );
  }

  Widget buildDisagreeItem(AddFriendListModel addFriendListModel) {
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
              image: AssetImage(addFriendListModel.head),
            ),
          ),
          width: 40.0,
          height: 40.0,
        ),
        title: Text(
          addFriendListModel.name,
          style: TextStyle(fontSize: 16.0),
        ),
        trailing: Text('已拒绝'),
        onTap: (){

        },
      ),
    );
  }

  Widget buildWaitItem(AddFriendListModel addFriendListModel) {
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
              image: AssetImage(addFriendListModel.head),
            ),
          ),
          width: 40.0,
          height: 40.0,
        ),
        title:Row(
          children: [
            Expanded(
              child: Text(
                addFriendListModel.name,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            MaterialButton(
              minWidth: 20.0,
                height: 30.0,
                child: Text('同意',style: TextStyle(fontSize: 12.0),),
                color: Color.fromARGB(255, 107,186,216),
                onPressed: (){
                  addFriend(addFriendListModel.id);
                }
            ),
            SizedBox(
              width: 10.0,
            ),
            MaterialButton(
              minWidth: 20.0,
                height: 30.0,
                child: Text('拒绝',style: TextStyle(fontSize: 12.0),),
                color: Colors.red,
                onPressed: (){
                  refuseAddFriend(addFriendListModel.id);
                }
            ),
          ],
        ),
        onTap: (){

        },
      ),
    );
  }

}
