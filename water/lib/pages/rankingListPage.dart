import 'package:flutter/material.dart';
import 'package:water/views/list/rankList.dart';

class RankingListPage extends StatefulWidget {
  const RankingListPage({Key? key}) : super(key: key);

  @override
  _RankingListPageState createState() {
    return _RankingListPageState();
  }
}

class _RankingListPageState extends State<RankingListPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/head1.png'),
                ),
              ),
            ),
          ),
          title: Text(
            '区域日榜',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image(
                image: AssetImage("assets/icon/change.png"),
              ),
            ),
          ],
        ),
        body: RankList()
    );
  }
}
