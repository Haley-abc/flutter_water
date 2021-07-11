import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water/login/regist.dart';
import 'package:water/network/data_model.dart';
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

  //从数据库获得的密码
  String password="1";

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
              //用户头像
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
              //用户手机号输入框
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

  /**
   * 创建密码框组件
   */
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

  /**
   * 创建手机框组件
   */
  Widget buildUserNameWidget() {
    return TextField(
      //焦点控制
      focusNode: _userNameFocusNode,
      //文本控制器
      controller: _userNameController,
      //边框样式设置
      decoration: InputDecoration(
        //红色的错误提示文本
        labelText: "手机",
        //设置上下左右 都有边框
        //设置四个角的弧度
        border: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  /**
   * 检查账号密码
   */
  void checkLoginFunction() {
    String passwordController=_passwordController.text;
    hindKeyBoarder();
    if(password==passwordController){
      actionStart();
    }else{
      Fluttertoast.showToast(msg: "账号或密码不存在！");
    }
  }

  /**
   * 跳转到主页
   */
  void actionStart(){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavigationBarDemo()));
  }

  /**
   * 隐藏键盘
   */
  void hindKeyBoarder() {
    //输入框失去焦点
    _userNameFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /**
   * http
   */
  loginFunction() async{
    String phoneController=_userNameController.text;
    BaseOptions options = new BaseOptions(
        baseUrl: "http://10.0.2.2:8080/demo/user/queryByPhone",
        connectTimeout: 50000);
    Dio dio = new Dio(options);
    var response=await dio.get("http://10.0.2.2:8080/demo/user/queryByPhone",queryParameters: {"phone":phoneController});
    password=response.data["password"];
  }
}

/**
 * 注册和忘记密码
 */
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
