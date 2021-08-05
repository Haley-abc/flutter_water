import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:water/ui/UserModel.dart';
import 'package:water/ui/data.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() {
    return _FriendListState();
  }
}

class _FriendListState extends State<FriendList>{

  List<UserModel> users=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<void> initData() async{
    BaseOptions options = new BaseOptions(
        baseUrl: "http://47.97.192.128:8080/demo/friend",
        connectTimeout: 50000);
    Dio dio = new Dio(options);
    var response=await dio.get("/queryFriends",queryParameters: {"id":Global.id});
    List<dynamic> value = response.data;
    List<UserModel> users2=[];
    for(var i=0;i<value.length;i++){
      UserModel user = UserModel.formMap(value[i]);
      users2.add(user);
    }
    setState(() {
      users=users2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
        return Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(users[index].head),
                  ),
                ),
                width: 40.0,
                height: 40.0,
              ),
              title: Text(
                users[index].name,
                style: TextStyle(
                    fontSize: 16.0
                ),
              ),
            ),
            Divider(),
          ],
        );

      },
    );
  }
}
