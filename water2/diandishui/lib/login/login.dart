import 'dart:async';

import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/login/regist.dart';
import 'package:diandishui/module/color.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/module/navigation_bar.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/utils/storage_util.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //用户名输入框的焦点控制
  FocusNode phoneFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool passwordVisible = true;

  String animationType = "idle";

  void hindKeyBoarder() {
    //输入框失去焦点
    phoneFocusNode.unfocus();
    passwordFocusNode.unfocus();
    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void initState() {
    super.initState();
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "hands_up";
        });
      } else {
        setState(() {
          animationType = "hands_down";
        });
//        Future.delayed(Duration(milliseconds: 500), () {
//          setState(() {
//            animationType = "idle";
//          });
//        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //手势识别点击空白隐藏键盘
    return GestureDetector(
      onTap: () {
        hindKeyBoarder();
      }, //点击事件
      child: Scaffold(
        body: buildLoginWidget(),
      ),
    );
  }

//登录页面的主体
  Widget buildLoginWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          color: greyF3F3F3,
          padding: EdgeInsets.only(top: 60, bottom: 30),
          child: FlareActor('assets/Teddy.flr',
              shouldClip: false,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              animation: animationType),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 270),
          decoration: BoxDecoration(
            borderRadius: borderRadiusOnlyLeftRightTop24(),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 36, horizontal: 44),
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    '点滴水',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 54,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusAll8(),
                      color: greyF6F6F6,
                    ),
                    child: TextFormField(
                      focusNode: phoneFocusNode,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '手机',
                          prefixIcon: Icon(Icons.person_outline),
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey)),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 54,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusAll8(),
                      color: greyF6F6F6,
                    ),
                    child: TextFormField(
                      obscureText: passwordVisible,
                      controller: passwordController,
                      maxLines: 1,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '密码',
                        prefixIcon: Icon(Icons.lock_outline),
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            //根据passwordVisible状态显示不同的图标
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            //更新状态控制密码显示或隐藏
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        if (animationType != "hands_down") {
                          animationType = "hands_down";
                        }
                      });
                      submitLogin();
                    },
                    child: Text(
                      '登录',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                    color: titleColor,
                    elevation: 0,
                    minWidth: 400,
                    height: 54,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: borderRadiusAll8()),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10,left: 60),
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '忘记密码？',
                            style: TextStyle(
                                fontSize: 16,
                                color: greyCCCCCC,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                          },
                          child: Text(
                            '注册',
                            style: TextStyle(
                                fontSize: 16,
                                color: greyCCCCCC,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  /**
   * 登录
   */
  void submitLogin() async {
    String phone = phoneController.text;
    String password = passwordController.text;
    phoneController.clear();
    passwordController.clear();

    HttpRequest.request("$BASE_URL/user/login",
        method: "post",
        data: {"phone": phone, "password": password}).then((value) {
      if (value.data["code"] == 200) {
        GlobalData.id = value.data["result"]["id"];
        GlobalData.name = value.data["result"]["name"];
        GlobalData.phone = phone;
        GlobalData.sex = value.data["result"]["sex"];
        GlobalData.head = value.data["result"]["head"];
        setState(() {
          animationType = "success";
        });
        Future.delayed(Duration(milliseconds: 1000), () async {
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new NavigationPage()),
              (route) => route == null);
          setState(() {
            animationType = "idle";
          });
          StorageUtil.setStringItem("phone", phone);
          StorageUtil.setStringItem("password", password);
        });
        Fluttertoast.showToast(msg: "登录成功");
      } else {
        setState(() {
          animationType = "fail";
        });
        Future.delayed(Duration(milliseconds: 3000), () {
          setState(() {
            animationType = "idle";
          });
        });
        Fluttertoast.showToast(msg: value.data["message"]);
      }
    });
  }
}
