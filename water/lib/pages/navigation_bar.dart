import 'package:flutter/material.dart';
import 'rankingListPage.dart';
import 'socialContactPage.dart';
import 'waterPage.dart';

class NavigationBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationPage();
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

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
          RankingListPage(),
          SocialContactPage(),
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
/*
导航栏组件

class NavigetionPage extends StatefulWidget{
  const NavigetionPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState(){
    return _NavigationPageState();
  }
}

导航栏组件

class _NavigationPageState extends State<NavigetionPage>{
  int _currentIndex = 0;
  final _widgetOptions = [
    WaterPage(),
    RankingListPage(),
    SocialContactPage(),
    Text('服务'),
    Text('水库'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Row(
            children: <Widget>[
              Align(
                alignment: FractionalOffset.centerLeft,
                child:Row(
                  children:<Widget> [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/head1.png'),
                        ),
                      ),
                      width: 35.0,
                      height: 35.0,
                    ),
                    Container(
                      child:Text(
                        "Haley",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.centerRight,
                child: IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage("images/friends.png"),
                    )),
              )
            ],
          ),
        ),
        body: _widgetOptions.elementAt((_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.water),
              title: Text('用水')),
          BottomNavigationBarItem(icon: Icon(Icons.list),
              title: Text('排行榜')),
          BottomNavigationBarItem(icon: Icon(Icons.people),
              title: Text('社交')),
          BottomNavigationBarItem(icon: Icon(Icons.room_service),
              title: Text('服务')),
          BottomNavigationBarItem(icon: Icon(Icons.games),
              title: Text('水库')),
        ],
        currentIndex: _currentIndex,//当前选中项索引
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.greenAccent,//设置选中颜色
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _currentIndex=index;
    });
  }
} */