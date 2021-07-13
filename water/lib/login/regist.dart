import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water/login/login.dart';
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
  FocusNode _sexFocusNode = new FocusNode();


  //文本输入框控制器
  TextEditingController _userPhoneController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _sureController = new TextEditingController();
  TextEditingController _sexController = new TextEditingController();

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
        //注册页面的主体
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
              //手机号输入框
              buildUserPhoneWidget(),
              SizedBox(
                height: 15,
              ),
              //用户昵称输入框
              buildUserNameWidget(),
              SizedBox(
                height: 15,
              ),
              //用户性别输入框
              buildSexWidget(),
              SizedBox(
                height: 15,
              ),
              //用户密码输入框
              buildUserPasswordWidget(),
              SizedBox(
                height: 15,
              ),
              //确认密码输入框
              buildSureWidget(),
              SizedBox(height: 15),
              //注册按钮
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "注册",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    checkPassword();
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

  /**
   * 性别输入框
   */
  Widget buildSexWidget() {
    return TextField(
      focusNode: _sexFocusNode,
      controller: _sexController,
      //最大可输入1行
      maxLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        labelText: "性别",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }


  ///用户名输入框 Stream 局部更新 error提示
  ///     ShakeAnimationWidget 抖动动画
  ///

  void checkPassword() {
    String password=_passwordController.text;
    String sure=_sureController.text;
    if(password==sure){
      registFunction();
    }else{
      Fluttertoast.showToast(msg: "两次密码不一致！");
    }
  }

  void actionStart() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginPage()));
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

  void registFunction() async{
    String phoneController=_userPhoneController.text;
    String nameController=_userNameController.text;
    String passwordController=_passwordController.text;
    String sexController=_sexController.text;
    BaseOptions options = new BaseOptions(
        baseUrl: "http://47.97.192.128:8080/demo/user",
        connectTimeout: 50000);
    Dio dio = new Dio(options);
    var response=await dio.get("/queryByPhone",queryParameters: {"phone":phoneController});
    if(response.toString()!=""){
      Fluttertoast.showToast(msg: "账号已存在！");
    }else{
      var response2=await dio.post("/saveOne",data: {"phone":phoneController,"name":nameController,"password":passwordController,"sex":sexController});
      String message=response2.data["message"];
      if(message=="保存成功"){
        Fluttertoast.showToast(msg: "注册成功！");
      }else{
        Fluttertoast.showToast(msg: "注册失败！");
      }
    }
  }
}