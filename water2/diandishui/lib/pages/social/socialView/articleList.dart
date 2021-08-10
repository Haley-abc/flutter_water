import 'package:diandishui/model/articleModel.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticalList extends StatefulWidget {
  @override
  _ArticalListState createState() {
    return _ArticalListState();
  }
}

class _ArticalListState extends State<ArticalList> {
  List<ArticleModel> articleList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<void> initData() async {
    HttpRequest.request(
      "$BASE_URL/article/selectAllArticle",
      method: "get",
    ).then((value) {
      if (value.data["code"] == 200) {
        List<ArticleModel> articleList2 = [];
        List<dynamic> result = value.data["result"];
        for (var i = 0; i < result.length; i++) {
          ArticleModel articleModel = ArticleModel.formMap(result[i]);
          articleList2.add(articleModel);
        }
        setState(() {
          articleList = articleList2;
        });
      } else {
        print("获取好友列表失败");
      }
    });
  }

  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        initData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadiusAll8(),
              boxShadow: [shadowOffsetY2()],
            ),
            margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(articleList[index].head),
                      ),
                    ),
                    width: 40.0,
                    height: 40.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(articleList[index].name),
                        Text(
                          articleList[index].articleDate,
                          style:
                          TextStyle(fontSize: 11.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articleList[index].content,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      onRefresh: _handleRefresh,
    );
  }
}
