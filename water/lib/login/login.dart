import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water/login/regist.dart';
import 'package:water/network/http_config.dart';
import 'package:water/network/http_request.dart';
import 'package:water/pages/navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //用户名输入框的焦点控制
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //手势识别点击空白隐藏键盘
    return GestureDetector(
      onTap: () {
        hindKeyBoarder();
      }, //点击事件
      child: Scaffold(
        appBar: AppBar(
          title: Text("登录"),
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 160.0,
                width: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/head1.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              //用户名输入框
              buildUserNameWidget(),
              SizedBox(
                height: 15,
              ),
              //用户密码输入框
              buildUserPasswordWidget(),
              SizedBox(height: 15),
              //登录按钮
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    checkLoginFunction();
                  },
                ),
              ),
              SizedBox(height: 20),
              RowWidget(),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildUserPasswordWidget() {
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

  ///用户名输入框 Stream 局部更新 error提示
  ///     ShakeAnimationWidget 抖动动画
  ///
  Widget buildUserNameWidget() {
    return TextField(
      //焦点控制
      focusNode: _userNameFocusNode,
      //文本控制器
      controller: _userNameController,
      //键盘回车键点击回调
      //边框样式设置
      decoration: InputDecoration(
        //红色的错误提示文本
        labelText: "用户名",
        //设置上下左右 都有边框
        //设置四个角的弧度
        border: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  void checkLoginFunction() {
    hindKeyBoarder();
    actionStart();
  }

  void actionStart() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavigationBarDemo()));
    });
  }

  void hindKeyBoarder() {
    //输入框失去焦点
    _userNameFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  loginFunction() async {
    BaseOptions options = new BaseOptions(
        baseUrl: "http://10.0.2.2:8080/demo/user/queryById?id=1",
        connectTimeout: 50000);
    Dio dio = new Dio(options);
    dio.get("http://10.0.2.2:8080/demo/user/queryById?id=1").then((value) {
      print(value.toString());
      Fluttertoast.showToast(msg: value.toString());
    });
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '注册',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      })
              ]),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '忘记密码？',
                    style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Fluttertoast.showToast(msg: '好气哦，我也不记得了！');
                      })
              ]),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
