import 'package:flutter/material.dart';

class NewFriendsPage extends StatefulWidget {
  @override
  _NewFriendsPageState createState() {
    return _NewFriendsPageState();
  }
}

class _NewFriendsPageState extends State<NewFriendsPage> {

  //用户名输入框的焦点控制
  FocusNode _phoneFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height-140;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              Expanded(
                  child: TextField(
                    focusNode: _phoneFocusNode,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText:'请输入手机号',
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                width: 50.0,
                child: InkWell(child: Text('查找'),onTap: (){},),
              )
            ],
          ),
        ],
     ),
    );
  }
}
