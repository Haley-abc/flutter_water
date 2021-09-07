import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/model/rankingListModel.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:flutter/material.dart';

class RankList extends StatefulWidget {
  @override
  _RankListState createState() {
    return _RankListState();
  }
}

class _RankListState extends State<RankList> {

  List<RankingListModel> rankingList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<void> initData() async {
    HttpRequest.request("$BASE_URL/waterConsumption/dailyList",
        method: "post",
        data: {
          "userId": GlobalData.id,
          "waterDate": "2021-08-17"
        }).then((value) {
      if (value.data["code"] == 200) {
        List<RankingListModel> rankinglist2 = [];
        List<dynamic> result = value.data["result"];
        for (var i = 0; i < result.length; i++) {
          RankingListModel rankingListModel = RankingListModel.formMap(result[i]);
          rankinglist2.add(rankingListModel);
        }
        setState(() {
          rankingList = rankinglist2;
        });
      } else {
        print("获取排行榜失败");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rankingList.length,
      itemBuilder: (context, index) {
        int num = index+1;
        return Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(rankingList[index].head),
                  ),
                ),
                width: 40.0,
                height: 40.0,
              ),
              title: Container(
                margin: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(rankingList[index].name),
                    SizedBox(height: 5.0,),
                    Text(
                      rankingList[index].waterConsumption.toString()+" L",
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              trailing: Container(
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                child: Text(
                  '$num',
                  style: TextStyle(
                    fontSize: 25.0
                  ),
                ),
              )
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
