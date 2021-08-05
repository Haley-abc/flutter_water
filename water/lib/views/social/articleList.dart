import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/ui/ArticalModel.dart';

class ArticalList extends StatefulWidget {
  @override
  _ArticalListState createState() {
    return _ArticalListState();
  }
}

class _ArticalListState extends State<ArticalList> {

  List<ArticleModel> articles=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<void> initData() async{
    BaseOptions options = new BaseOptions(
        baseUrl: "http://192.168.0.160:8080/demo/article",
        connectTimeout: 50000);
    Dio dio = new Dio(options);
    var response=await dio.get("/queryArticles");
    List<dynamic> value = response.data;
    List<ArticleModel> articles2=[];
    for(var i=0;i<value.length;i++){
      ArticleModel article = ArticleModel.formMap(value[i]);
      articles2.add(article);
    }
    setState(() {
      articles=articles2;
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
        child:
        ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(articles[index].userModel.head),
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
                            Text(articles[index].userModel.name),
                            Text(
                              articles[index].atricleDate,
                              style: TextStyle(fontSize: 11.0, color: Colors.grey),
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
                          articles[index].content,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
        onRefresh: _handleRefresh,
    );

  }
}
