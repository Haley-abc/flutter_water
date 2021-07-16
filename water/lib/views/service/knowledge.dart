import 'package:flutter/material.dart';
import 'package:water/views/social/articleList.dart';

class KnowledgePage extends StatefulWidget {
  @override
  _KnowledgePageState createState() {
    return _KnowledgePageState();
  }
}

class _KnowledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height-196;
    return Container(
      height: height1,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          return ListTile(
            leading: Image.asset(
                'assets/images/pic.png',
            ),
            title: Text('2021年水利政策法规工作'),
            subtitle: Text('    2021年水利政策法规工作，17项要点值得关注2021年水利政策法规工作，17项要点值得关注2021年水利政策法规工作，17项要点值得关注。'),
          );
        },
      ),
    );
  }
}
