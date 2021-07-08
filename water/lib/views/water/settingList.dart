import 'package:flutter/material.dart';

class SettingList extends StatefulWidget {
  @override
  _SettingListState createState() {
    return _SettingListState();
  }
}

class _SettingListState extends State<SettingList> {
  final List<String> name = ['账号管理', '保修服务', '注销'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(name[index]),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}
