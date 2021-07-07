import 'package:flutter/material.dart';

class ArticalList extends StatefulWidget {
  @override
  _ArticalListState createState() {
    return _ArticalListState();
  }
}

class _ArticalListState extends State<ArticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider();
        }
        return ListTile(
          title: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/head2.png'),
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
                    Text('用户$index'),
                    Text(
                      '07-06 19:00',
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
              children: <Widget>[
                Text(
                  '    关注@王者荣耀 带话题#大乔新皮肤白鹤梁神女#转发此条微博，随机揪5人各送1款【大乔·白鹤梁神女】永久皮肤，再揪5人各送100皮肤基金',
                  style: TextStyle(fontSize: 16.0),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 150.0),
                  child: Image.asset(
                    'assets/images/pic.png',
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(top: 5.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
