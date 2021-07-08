import 'package:flutter/material.dart';
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
            fontSize: 17.0,
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
  final List<String> name = ['头像', '昵称', '性别','手机', '密码'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
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
