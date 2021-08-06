import 'package:diandishui/module/effect.dart';
import 'package:diandishui/module/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key key}) : super(key: key);

  @override
  RankingPageState createState() {
    return RankingPageState();
  }
}

class RankingPageState extends State<RankingPage> {

  String resultMessage = "好友日榜";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(titleHeadPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/icon/girl.png"),
                ),
              ),
            ),
          ),
          title: Text(
            resultMessage,
            style: TextStyle(
              fontSize: titleSize,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showBottomSheet();
              },
              icon: Image(
                image: AssetImage("assets/icon/change.png"),
              ),
            ),
          ],
        ),
        body: Text("body")
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
    //弹框中内容  310 的调试
    return Container(
      height: 150,
      child: Column(
        children: [
          buildItem("好友日榜",onTap:(){
            setState(() {
              resultMessage = "好友日榜";
            });
          }),
          //分割线
          Divider(),
          buildItem("好友周榜",onTap:(){
            setState(() {
              resultMessage = "好友周榜";
            });
          }),

          Container(color: Colors.grey[300],height: 6,),

          //取消按钮
          //添加个点击事件
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
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
        height: 40,
        //左右排开的线性布局
        child: Text(title),
        alignment: Alignment.center,
      ),
    );
  }
}