import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  _WaterPageState createState() {
    return _WaterPageState();
  }
}

class _WaterPageState extends State<WaterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height1 = MediaQuery.of(context).size.height;
    double height = width * 1.0 / 2.0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
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
            'Haley',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage("assets/icon/setting.png"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
