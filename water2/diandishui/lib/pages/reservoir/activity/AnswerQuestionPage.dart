import 'package:diandishui/model/activityModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:flutter/material.dart';

class AnswerQuestionPage extends StatefulWidget {
  const AnswerQuestionPage({Key key}) : super(key: key);

  @override
  _AnswerQuestionPageState createState() => _AnswerQuestionPageState();
}

class _AnswerQuestionPageState extends State<AnswerQuestionPage> {

  String options = 'options';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "每日答题",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("确定提交?"),
                      actions: <Widget>[
                        FlatButton(
                            child: Text("确定"),
                            onPressed: () => Navigator.pop(context, "cancel")),
                        FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.pop(context, "yes")),
                      ],
                    );
                  });
            },
            icon: Image(
              image: AssetImage("assets/icon/yes.png"),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text((index+1).toString()+'. '+'我国降水量分布很不平衡，地理差异很大，表现为（）。'),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: <Widget>[
                          RadioListTile<String>(
                            value: 'a',
                            title: Text('北多南少，东多西少'),
                            groupValue: options,
                            onChanged: (value) {
                              setState(() {
                                options = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            value: 'b',
                            title: Text('南多北少，西多东少'),
                            groupValue: options,
                            onChanged: (value) {
                              setState(() {
                                options = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            value: 'c',
                            title: Text('南多北少，东多西少'),
                            groupValue: options,
                            onChanged: (value) {
                              setState(() {
                                options = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            value: 'd',
                            title: Text('北多南少，西多东少'),
                            groupValue: options,
                            onChanged: (value) {
                              setState(() {
                                options = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
