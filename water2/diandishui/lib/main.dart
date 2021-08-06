import 'package:diandishui/login/login.dart';
import 'package:diandishui/module/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '点滴水',
      theme: ThemeData(primaryColor: titleColor),
      home: LoginPage(),
    );
  }
}