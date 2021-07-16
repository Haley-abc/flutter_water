import 'package:flutter/material.dart';
import 'package:water/ui/word.dart';
import 'package:water/views/social/friendList.dart';
import 'package:water/views/social/searchFriendList.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {

  //用户名输入框的焦点控制
  FocusNode _phoneFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController _phoneController = new TextEditingController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_currentIndex),
      // ),
      appBar: AppBar(
        title: Text(
          '找人',
          style: TextStyle(
            fontSize: APPBARTITLE,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                child: InkWell(child: Text('查找'),),
              )
            ],
          ),
          SizedBox(height: 20.0,),
          Expanded(child: (SearchFriendList())),
        ],
      ),
    );
  }



}
