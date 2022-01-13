import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:flutter/material.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserInfoPage extends StatefulWidget {

  final FriendListModel user;

  const UserInfoPage({Key key,@required this.user}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  bool isFriend = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFriendExit();
  }

  Future<void> isFriendExit() async {
    HttpRequest.request("$BASE_URL/friend/isFriendExit",
        method: "post",
        data: {"userId":GlobalData.id,"friendId": widget.user.id}).then((value) {
      if (value.data["code"] == 200) {
        setState(() {
          isFriend = true;
        });
      } else {
        setState(() {
          isFriend = false;
        });
      }
    });
  }

  Future<void> addFriendRquest() async {
    HttpRequest.request("$BASE_URL/addFriend/addFriendRequest",
        method: "post",
        data: {"userId":widget.user.id,"friendId": GlobalData.id,"state": 0}).then((value) {
      if (value.data["code"] == 200) {
        Fluttertoast.showToast(msg: '发送成功！');
      } else {
        Fluttertoast.showToast(msg: value.data["message"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFriendPage()));
            },
            icon: Image(
              image: AssetImage("assets/icon/white_dots.png"),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            width: width,
            height: height/6,
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.user.head),
                    ),
                  ),
                  width: height/6-60,
                  height: height/6-60,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  widget.user.name,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !isFriend,
            child: IconButton(
              onPressed: () {
                showBottomSheet();
              },
              icon: Image(
                image: AssetImage("assets/icon/add_blue.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(builder: (BuildContext context) {
      //构建弹框中的内容
      return buildBottomSheetWidget(context);
    }, context: context);
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          buildItem("添加好友",onTap:(){
            addFriendRquest();
          }),
          Container(color: Colors.grey[300],height: 6,),
          //取消按钮
          //添加个点击事件
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text("取消"),
              height: 44,
              alignment: Alignment.center,
            ),)
        ],
      ),
    );
  }

  Widget buildItem(String title,{@required Function onTap}){
    //添加点击事件
    return InkWell(
      //点击回调
      onTap: (){
        //关闭弹框
        Navigator.of(context).pop();
        //外部回调
        if(onTap!=null){
          onTap();
        }
      },
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 40,
          //左右排开的线性布局
          child: Text(title)
      ),
    );
  }
}