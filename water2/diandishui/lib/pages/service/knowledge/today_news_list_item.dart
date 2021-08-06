import 'package:diandishui/module/effect.dart';
import 'package:diandishui/pages/service/knowledge/image_widget.dart';
import 'package:diandishui/pages/service/knowledge/today_new_detail.dart';
import 'package:diandishui/pages/service/knowledge/today_news_list_item_data.dart';
import 'package:flutter/material.dart';

Widget initTodayNewsListItem(BuildContext context, TodayNewsListItemData item) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TodayNewsDetail(url: item.url, title: item.title)));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadiusAll8(),
        boxShadow: [shadowOffsetY2()],
      ),
      child: Row(
        children: <Widget>[
          initNewsText(item.title, item.ctime, item.source),
          initNewsImage(item.picUrl)
        ],
      ),
    ),
  );
}

Widget initNewsText(String title, String time, String source) {
  return Expanded(
      child: Container(
    height: 100,
    padding: EdgeInsets.only(right: 12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '$time  $source',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ),
  ));
}

Widget initNewsImage(String headerImagePath) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: ImageWidget(url: headerImagePath, w: 140, h: 100));
}
