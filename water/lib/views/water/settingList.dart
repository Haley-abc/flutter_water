import 'package:flutter/material.dart';
import 'package:water/pages/water/setting/personalInformation.dart';
import 'package:water/pages/water/setting/repairPage.dart';

class SettingList extends StatefulWidget {
  @override
  _SettingListState createState() {
    return _SettingListState();
  }
}

class _SettingListState extends State<SettingList> {
  final List<String> name = ['编辑资料', '报修服务'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(name[index]),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap:(){
                  Navigator.push(context,
                      //push跳转页面时，通过构造方法传递数据
                      MaterialPageRoute(
                          builder:(context) => skip(name[index]),
                      )
                  );
                }
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }

  skip(String choice){
    switch(choice){
      case '编辑资料':
        return PersonalInformationPage();
      case '报修服务':
        return RepairPage();
    }
  }
}
