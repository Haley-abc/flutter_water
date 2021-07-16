import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:water/ui/data.dart';
import 'package:water/ui/word.dart';
import 'package:water/views/water/settingList.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  _PersonalInformationPageState createState() {
    return _PersonalInformationPageState();
  }
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '编辑资料',
          style: TextStyle(
            fontSize: APPBARTITLE,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Image(
              image: AssetImage("assets/icon/save.png"),
            ),
          ),
        ],
      ),
      body: EditDateList(),
    );
  }
}

class EditDateList extends StatefulWidget {
  @override
  _EditDateListState createState() {
    return _EditDateListState();
  }
}

class _EditDateListState extends State<EditDateList> {
  FocusNode phoneFocus = new FocusNode();
  FocusNode nameFocus = new FocusNode();
  FocusNode sexFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  TextEditingController phoneController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController sexController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 10.0,
            child: Container(color: Color.fromRGBO(224, 224, 224, 1))),
        buildItem('手机号码', phoneFocus, phoneController, true, Global.phone),
        buildItem('昵称', nameFocus, nameController, false, Global.name),
        buildItem('性别', sexFocus, sexController, false, Global.sex),
        buildPassword(),
        Expanded(
            child: Container(
          color: Color.fromRGBO(224, 224, 224, 1),
        )),
      ],
    );
  }

  Widget buildItem(String title, FocusNode textFocusNode,
      TextEditingController textEditingController, bool state, String content) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 80.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
                child: TextField(
              onTap: () {
                if (state) Fluttertoast.showToast(msg: '无法修改！');
              },
              focusNode: textFocusNode,
              readOnly: state,
              controller: textEditingController,
              maxLines: 1,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: content,
                border: InputBorder.none,
                focusedBorder: new UnderlineInputBorder(
                  // 焦点集中的时候颜色
                  borderSide: BorderSide(color: Color(0x19000000)),
                ),
              ),
            ))
          ],
        ),
        SizedBox(
            height: 10.0,
            child: Container(
              color: Color.fromRGBO(224, 224, 224, 1),
            )),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 80.0,
              child: Text(
                '密码',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: TextField(
                onTap: () {
                  Fluttertoast.showToast(msg: '无法修改！');
                },
                readOnly: true,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '******',
                ),
              ),
            )
          ],
        ),
        SizedBox(
            height: 10.0,
            child: Container(
              color: Color.fromRGBO(224, 224, 224, 1),
            )),
      ],
    );
  }
}
