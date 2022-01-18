import 'package:diandishui/model/activityModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/reservoir/activity/AnswerQuestionPage.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {

  const ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  List<ActivityModel> activityModels = [
    new ActivityModel(
        'assets/icon/answer_questions.png', "每日答题", "答题得金币，金币多多",AnswerQuestionPage()),
  ];

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
          "活动",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: activityModels.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(activityModels[index].head),
                        ),
                      ),
                      width: 40.0,
                      height: 40.0,
                    ),
                    title: Text(activityModels[index].name),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            activityModels[index].description,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AnswerQuestionPage()));
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            );
          }),
    );
  }

}