import 'package:flutter/material.dart';
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
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '编辑资料',
          style: TextStyle(
            fontSize: APPBARTITLE,
          ),
        ),
        centerTitle: true,
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
        SizedBox(height: 10.0,child: Container(color: Color.fromRGBO(224, 224, 224, 1))),
        buildItem('手机号码', phoneFocus, phoneController, 1),
        buildItem('昵称', nameFocus, nameController, 1),
        buildItem('性别', sexFocus, sexController, 1),
        buildPassword(),
        Expanded(child: Container(color: Color.fromRGBO(224, 224, 224, 1),)),
      ],
    );
  }

  Widget buildItem(String title, FocusNode textFocusNode,
      TextEditingController textEditingController, int state) {
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
              focusNode: textFocusNode,
              controller: textEditingController,
              maxLines: 1,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: new UnderlineInputBorder(
                  // 焦点集中的时候颜色
                  borderSide: BorderSide(color: Color(0x19000000)),
                ),
              ),
            ))
          ],
        ),
        SizedBox(height: 10.0,child: Container(color: Color.fromRGBO(224, 224, 224, 1),)),
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
                  readOnly: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: new UnderlineInputBorder(
                      // 焦点集中的时候颜色
                      borderSide: BorderSide(color: Color(0x19000000)),
                    ),
                    hintText: '******',
                  ),
                ))
          ],
        ),
        SizedBox(height: 10.0,child: Container(color: Color.fromRGBO(224, 224, 224, 1),)),
      ],
    );
  }
}
