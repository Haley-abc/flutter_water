import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/ui/word.dart';

class ReservoirPage extends StatefulWidget {
  const ReservoirPage({Key? key}) : super(key: key);

  @override
  _ReservoirPageState createState() {
    return _ReservoirPageState();
  }
}

class _ReservoirPageState extends State<ReservoirPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height1 = MediaQuery
        .of(context)
        .size
        .height;
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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('1级水库',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),),
                Text('当前伤害值：50',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),),
              ],
            )
        ),
        body: Container(
          height: height1,
          width: width,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/images/ocean.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              buildButtons()
            ],
          )
        )
    );
  }
  Widget buildButtons(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Image(
            image: AssetImage("assets/icon/shop.png"),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image(
            image: AssetImage("assets/icon/bag.png"),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image(
            image: AssetImage("assets/icon/friend.png"),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image(
            image: AssetImage("assets/icon/question.png"),
          ),
        ),
      ],
    );
  }
}
