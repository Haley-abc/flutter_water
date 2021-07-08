import 'package:flutter/material.dart';
import 'package:water/ui/word.dart';
import 'package:water/views/service/activity.dart';
import 'package:water/views/service/class.dart';
import 'package:water/views/service/knowledge.dart';
import 'package:water/views/service/policy.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  _ServicePageState createState() {
    return _ServicePageState();
  }
}

class _ServicePageState extends State<ServicePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(HEADPADDING),
          child:
          Container(
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
          '服务',
          style: TextStyle(
            fontSize: APPBARTITLE,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    child:
                    Container(width: 50,height: 50,
                      child:  Center(child:
                      Text("知识科普"),
                      ),
                    ),
                    onTap: () {
                      _onItemTapped(0);
                    },
                  )
              ),
              Expanded(
                  child: InkWell(
                    child:
                    Container(width: 50,height: 50,
                      child:  Center(child:
                      Text("政策解读"),
                      ),
                    ),
                    onTap: () {
                      _onItemTapped(1);
                    },
                  )
              ),
              Expanded(
                  child: InkWell(
                    child:
                    Container(width: 50,height: 50,
                      child:  Center(child:
                      Text("活动宣传"),
                      ),
                    ),
                    onTap: () {
                      _onItemTapped(2);
                    },
                  )
              ),
              Expanded(
                  child: InkWell(
                    child:
                    Container(width: 50,height: 50,
                      child:  Center(child:
                      Text("课程开设"),
                      ),
                    ),
                    onTap: () {
                      _onItemTapped(3);
                    },
                  )
              ),
            ],
          ),
          IndexedStack(
            index: _currentIndex,
            children: [
              KnowledgePage(),
              PolicyPage(),
              ActivityPage(),
              ClassesPage(),
            ],
          ),
        ],
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
