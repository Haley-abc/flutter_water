import 'package:diandishui/module/color.dart';
import 'package:diandishui/module/effect.dart';
import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/service/activity/activityList.dart';
import 'package:diandishui/pages/service/classes/classesList.dart';
import 'package:diandishui/pages/service/knowledge/knowledgeList.dart';
import 'package:diandishui/pages/service/policy/policyList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  ServicePageState createState() {
    return ServicePageState();
  }
}

class ServicePageState extends State<ServicePage>
    with TickerProviderStateMixin {

  List<Tab> tabLabels = [
    Tab(text: '知识科普'),
    Tab(text: '政策解读'),
    Tab(text: '活动宣传'),
    Tab(text: '课程开设')
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLabels.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(titleHeadPadding),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/icon/girl.png"),
              ),
            ),
          ),
        ),
        title: Text(
          '服务',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Material(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: tabLabels,
              indicatorColor: titleColor,
            ),
          ),
        ),
          elevation: 1
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          KnowledgeList(),
          PolicyPage(),
          ActivityPage(),
          ClassesPage()
        ],
      ),
    );
  }
}