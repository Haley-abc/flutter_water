import 'package:diandishui/module/color.dart';
import 'package:diandishui/module/text.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TodayNewsDetail extends StatefulWidget {
  final String url;
  final String title;

  TodayNewsDetail({Key key, this.url, this.title}) : super(key: key);

  @override
  TodayNewsDetailState createState() => TodayNewsDetailState();
}

class TodayNewsDetailState extends State<TodayNewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        shadowColor: greyF6F6F6,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
