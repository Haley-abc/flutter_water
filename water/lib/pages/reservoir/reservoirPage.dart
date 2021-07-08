import 'package:flutter/material.dart';

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
          '水库',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
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
