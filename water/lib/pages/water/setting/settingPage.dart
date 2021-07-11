import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:water/login/login.dart';
import 'package:water/ui/word.dart';
import 'package:water/views/water/settingList.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '设置',
          style: TextStyle(
            fontSize: APPBARTITLE,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showBottomSheet();
            },
            icon: Image(
              image: AssetImage("assets/icon/logout.png"),
            ),
          ),
        ],
      ),
      body: SettingList(),
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
      height: 100,
      child: Column(
        children: [
          buildItem("注销",onTap:(){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
              width: MediaQuery.of(context).size.width,
              child: Text("取消"),
              height: 44,
              alignment: Alignment.center,
            ),)
        ],
      ),
    );
  }

  Widget buildItem(String title,{required Function onTap}){

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
