import 'package:diandishui/model/articleModel.dart';
import 'package:diandishui/model/friendListModel.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/network/http_config.dart';
import 'package:diandishui/network/http_request.dart';
import 'package:diandishui/pages/social/UserInfo.dart';
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
              padding: EdgeInsets.only(top: 4.0,bottom: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadiusAll8(),
                boxShadow: [shadowOffsetY2()],
              ),
              margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
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
                      onTap: (){
                        FriendListModel user = new FriendListModel();
                        user.setAll(articleList[index].id, articleList[index].name, articleList[index].head);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoPage(user: user,)));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(articleList[index].name),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            articleList[index].articleDate,
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          width: 30.0,
                          height: 30.0,
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: Image(
                              image: AssetImage("assets/icon/dots.png"),
                            ),
                          ),
                    ))
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
                /*
              trailing: IconButton(
                onPressed: () {
                },
                icon: Image(
                  image: AssetImage("assets/icon/dots.png"),
                ),
              ),*/
              ),
            );
          }),
      onRefresh: _handleRefresh,
    );
  }
}
