import 'package:flutter/material.dart';

BorderRadius borderRadiusAll8() {
  return BorderRadius.all(Radius.circular(8));
}

BorderRadius borderRadiusOnlyLeftRightTop24() {
  return BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24));
}

double titleHeadPadding = 11.0;//标题框头像padding

BoxShadow shadowOffsetY2() {
  return BoxShadow(
      color: Color.fromARGB(128, 204, 204, 204),
      blurRadius: 6.0,
      offset: Offset(0, 2));
}
