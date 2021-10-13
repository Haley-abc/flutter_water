import 'package:flutter/material.dart';

class SearchFriendsPage extends StatefulWidget {
  @override
  _SearchFriendsPageState createState() {
    return _SearchFriendsPageState();
  }
}

class _SearchFriendsPageState extends State<SearchFriendsPage> {
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height-140;
    return Container(
      height: height1,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          return ListTile(
            title: Text('2021年水利政策法规工作'),
            subtitle: Text('    2021年水利政策法规工作，17项要点值得关注2021年水利政策法规工作，17项要点值得关注2021年水利政策法规工作，17项要点值得关注。'),
          );
        },
      ),
    );
  }
}
