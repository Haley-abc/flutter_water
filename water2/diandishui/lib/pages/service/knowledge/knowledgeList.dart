import 'dart:convert';

import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/pages/service/knowledge/today_news_list_item.dart';
import 'package:diandishui/pages/service/knowledge/today_news_list_item_data.dart';
import 'package:flutter/material.dart';

class KnowledgeList extends StatefulWidget {
  KnowledgeList({
    Key key,
  }) : super(key: key);

  @override
  KnowledgeListState createState() => KnowledgeListState();
}

class KnowledgeListState extends State<KnowledgeList> {
  List<dynamic> tempList = [];
  List<TodayNewsListItemData> todayNewsList = [];
  String myKey = "982e83f8144d1cc9579dbb387a964404";

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
            () => setState(() {
          initData();
        }));
  }

  initData() async {
    HttpRequest.request("http://api.tianapi.com/huanbao/index",
        method: "GET",
        params: {'key': myKey, 'num': 10})
        .then((value) {
      setState(() {
        tempList = json.decode(value.toString())['newslist'];
      });
      for (int i = 0; i < tempList.length; i++) {
        todayNewsList.add(TodayNewsListItemData.fromMap(tempList[i]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todayNewsList.length,
      itemBuilder: (BuildContext context, int index) {
        return initTodayNewsListItem(context, todayNewsList[index]);
      },
    );
  }
}
