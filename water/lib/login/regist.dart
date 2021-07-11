import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water/network/http_config.dart';
import 'package:water/network/http_request.dart';
import 'package:water/pages/navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //用户名输入框的焦点控制
  FocusNode _userPhoneFocusNode = new FocusNode();
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();
  FocusNode _sureFocusNode = new FocusNode();


  //文本输入框控制器
  TextEditingController _userPhoneController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _sureController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //手势识别点击空白隐藏键盘
    return GestureDetector(
      onTap: () {
        hindKeyBoarder();
      }, //点击事件
      child: Scaffold(
        appBar: AppBar(
          title: Text("注册"),
          centerTitle: true,
        ),
        //登录页面的主体
        body: buildLoginWidget(),
      ),
    );
  }

//登录页面的主体
  Widget buildLoginWidget() {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(30.0),
          //线性布局
          child: Column(
            children: [
              //用户名输入框
              buildUserPhoneWidget(),
              SizedBox(
                height: 15,
              ),
              //用户密码输入框
              buildUserNameWidget(),
              SizedBox(
                height: 15,
              ),
              //用户密码输入框
              buildUserPasswordWidget(),
              SizedBox(
                height: 15,
              ),
              //用户密码输入框
              buildSureWidget(),
              SizedBox(height: 15),
              //登录按钮
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "注册",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    checkLoginFunction();
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildUserPhoneWidget() {
    return TextField(
      //焦点控制
      focusNode: _userPhoneFocusNode,
      //文本控制器
      controller: _userPhoneController,
      //键盘回车键点击回调
      //边框样式设置
      decoration: InputDecoration(
        //红色的错误提示文本
        labelText: "手机号",
        //设置上下左右 都有边框
        //设置四个角的弧度
        border: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  Widget buildUserNameWidget() {
    return TextField(
      focusNode: _userNameFocusNode,
      controller: _userNameController,
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        labelText: "昵称",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  Widget buildUserPasswordWidget() {
    String errorText;
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        labelText: "密码",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  Widget buildSureWidget() {
    return TextField(
      focusNode: _sureFocusNode,
      controller: _sureController,
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        labelText: "确认密码",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }


  ///用户名输入框 Stream 局部更新 error提示
  ///     ShakeAnimationWidget 抖动动画
  ///

  void checkLoginFunction() {
    hindKeyBoarder();
  }

  void actionStart() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavigationBarDemo()));
    });
  }

  void hindKeyBoarder() {
    //输入框失去焦点
    _userPhoneFocusNode.unfocus();
    _userNameFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _sureFocusNode.unfocus();

    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

}