import 'package:flutter/material.dart';

class RankList extends StatefulWidget {
  @override
  _RankListState createState() {
    return _RankListState();
  }
}

class _RankListState extends State<RankList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: Container(
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
              title: Container(
                margin: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('用户$index'),
                    Text(
                      '0.0 L',
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              trailing: Text(
                '$index',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey,
                ),
              ),
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
