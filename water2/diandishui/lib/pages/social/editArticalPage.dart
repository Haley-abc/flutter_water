import 'package:diandishui/global/function.dart';
import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/pages/social/socialView/image_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditArticaltPage extends StatefulWidget {
  const EditArticaltPage({Key key}) : super(key: key);

  @override
  _EditArticaltPageState createState() => _EditArticaltPageState();
}

class _EditArticaltPageState extends State<EditArticaltPage> {

  TextEditingController textEditingController = new TextEditingController();
  FocusNode textFocusNode = new FocusNode();
  ImageGridState _imgState = ImageGridState();

  Future<void> publishArticle(String content,String image) async {
    HttpRequest.request("$BASE_URL/article/save",
        method: "post",
        data: {
          "userId": GlobalData.id,
          "content": content,
          "articleDate": GlobalFunction.currentTimeMillis(),
          "image": image
        })
        .then((value) {
      String message = value.data["message"];
      if (message == "保存成功") {
        Fluttertoast.showToast(msg: "发表成功");
      } else {
        Fluttertoast.showToast(msg: "发表失败");
      }
    });
  }

  void showDialogFunction() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          titlePadding: EdgeInsets.all(10),
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          content: Text("您确定要发表吗?"),
          contentPadding: EdgeInsets.all(10),
          contentTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
          actions: <Widget>[
            TextButton(
              child: Text("确定"),
              onPressed: () {
                publishArticle(textEditingController.text, "");
                textEditingController.clear();
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '写动态',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if(textEditingController.text.isEmpty){
                Fluttertoast.showToast(msg: '内容不能为空！');
              }else{
                showDialogFunction();
              }
            },
            icon: Image(
              image: AssetImage("assets/icon/yes.png"),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
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
                        image: AssetImage(GlobalData.head),
                      ),
                    ),
                    width: 40.0,
                    height: 40.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    GlobalData.name,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: textEditingController,
              focusNode: textFocusNode,
              decoration: InputDecoration(
                hintText: '分享新鲜事...',
                border: InputBorder.none,
              ),
              maxLines: 6,
              minLines: 3,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //ImageGridWidget(myState:_imgState),
        ],
      )
    );
  }
}