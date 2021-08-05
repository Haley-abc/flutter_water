import 'package:diandishui/ranking/ReservoirPage.dart';
import 'package:diandishui/reservoir/ReservoirPage.dart';
import 'package:diandishui/service/ServicePage.dart';
import 'package:diandishui/social/SocialPage.dart';
import 'package:diandishui/water/waterPage.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}
/*
导航栏组件
 */
class _NavigationPageState extends State<NavigationPage>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_currentIndex),
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          WaterPage(),
          RankingPage(),
          SocialPage(),
          ServicePage(),
          ReservoirPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.water),
              title: Text('用水')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one),
              title: Text('排行榜')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('社交')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              title: Text('服务')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.games),
              title: Text('水库')
          ),
        ],
        currentIndex: _currentIndex,// 当前选中项的索引
        type: BottomNavigationBarType.fixed,// 更改显示模式
        // fixedColor: Colors.deepOrange,// 设置选中项的颜色
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}