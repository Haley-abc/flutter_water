import 'package:diandishui/global/myInfo.dart';
import 'package:diandishui/module/effect.dart';
import 'activity/ActivityPage.dart';
import 'package:diandishui/pages/reservoir/AwardsPage.dart';
import 'package:diandishui/pages/reservoir/BagPage.dart';
import 'package:diandishui/pages/reservoir/FriendPage.dart';
import 'package:diandishui/pages/reservoir/ShopPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservoirPage extends StatefulWidget {
  const ReservoirPage({Key key}) : super(key: key);

  @override
  ReservoirPageState createState() {
    return ReservoirPageState();
  }
}

class ReservoirPageState extends State<ReservoirPage> with SingleTickerProviderStateMixin{

  final Duration _duration = const Duration(milliseconds: 1000);
  AnimationController _controller;
  Animation<Offset> _animationElectricity;
  Animation<Offset> _animationIron;
  Animation<Offset> _animationNail;
  Animation<Offset> _animationWood;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);
    _animationElectricity = Tween<Offset>(begin: Offset(0, 0.3), end: Offset(0, 0.4))
        .animate(_controller)
      ..addListener(() {
//         AnimationController产生的数值取决于屏幕刷新情况，一秒60帧
//         数值生成之后，每个Animation对象都会通过Listener进行回调，下面实现动画监听
//        setState(() {
//          print(_animation.value);
//        });
      })
      ..addStatusListener((status) {
        // 实现动画循环
        if (status == AnimationStatus.completed) {
          // 正向结束时回调
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 反向执行 结束时会回调此方法
          _controller.forward();
        }
      });
    _animationWood = Tween<Offset>(begin: Offset(0, -0.5), end: Offset(0, -0.6))
        .animate(_controller)
      ..addListener(() {
//         AnimationController产生的数值取决于屏幕刷新情况，一秒60帧
//         数值生成之后，每个Animation对象都会通过Listener进行回调，下面实现动画监听
//        setState(() {
//          print(_animation.value);
//        });
      })
      ..addStatusListener((status) {
        // 实现动画循环
        if (status == AnimationStatus.completed) {
          // 正向结束时回调
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 反向执行 结束时会回调此方法
          _controller.forward();
        }
      });
    _animationIron = Tween<Offset>(begin: Offset(0, -0.5), end: Offset(0, -0.4))
        .animate(_controller)
      ..addListener(() {
//         AnimationController产生的数值取决于屏幕刷新情况，一秒60帧
//         数值生成之后，每个Animation对象都会通过Listener进行回调，下面实现动画监听
//        setState(() {
//          print(_animation.value);
//        });
      })
      ..addStatusListener((status) {
        // 实现动画循环
        if (status == AnimationStatus.completed) {
          // 正向结束时回调
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 反向执行 结束时会回调此方法
          _controller.forward();
        }
      });
    _animationNail = Tween<Offset>(begin: Offset(0, 0.4), end: Offset(0, 0.3))
        .animate(_controller)
      ..addListener(() {
//         AnimationController产生的数值取决于屏幕刷新情况，一秒60帧
//         数值生成之后，每个Animation对象都会通过Listener进行回调，下面实现动画监听
//        setState(() {
//          print(_animation.value);
//        });
      })
      ..addStatusListener((status) {
        // 实现动画循环
        if (status == AnimationStatus.completed) {
          // 正向结束时回调
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 反向执行 结束时会回调此方法
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-147;

    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(titleHeadPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(GlobalData.head),
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '1级水库',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
              Text(
                '当前伤害值：50',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ],
          )),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tree.png'),
            fit: BoxFit.fill, // 完全填充
          ),
        ),
        child: (
          Container(
            child: ListView(
              children: [
                Container(
                  height: height-80,
                  child: Column(
                    children: [
                      Container(
                        height: (height-80)/3,
                        child: Row(
                          children: [
                            SizedBox(width: 50.0,),
                            SlideTransition(
                              position: _animationElectricity,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/electricity.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationWood,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/wood.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationIron,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/iron.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationNail,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/nail.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: (height-80)/3*2,
                        child: Row(
                          children: [
                            SizedBox(width: 15.0,),
                            SlideTransition(
                              position: _animationElectricity,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/bottle1.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationWood,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/banana.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationIron,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/bottle2.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationNail,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/bottle3.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                            SlideTransition(
                              position: _animationIron,
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/bottle4.png"),
                                ),
                                iconSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopPage()));
                          },
                          icon: Image(
                            image: AssetImage("assets/icon/shop.png"),
                          ),
                        ),
                        Text("商店")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BagPage()));
                          },
                          icon: Image(
                            image: AssetImage("assets/icon/bag.png"),
                          ),
                        ),
                        Text("背包")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AwardsPage()));
                          },
                          icon: Image(
                            image: AssetImage("assets/icon/awards.png"),
                          ),
                        ),
                        Text("成就")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FriendPage()));
                          },
                          icon: Image(
                            image: AssetImage("assets/icon/friend.png"),
                          ),
                        ),
                        Text("好友")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivityPage()));
                          },
                          icon: Image(
                            image: AssetImage("assets/icon/activity.png"),
                          ),
                        ),
                        Text("活动")
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }


}
