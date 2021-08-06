import 'package:diandishui/module/text.dart';
import 'package:diandishui/pages/social/socialView/image_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditArticaltPage extends StatefulWidget {
  const EditArticaltPage({Key key}) : super(key: key);

  @override
  _EditArticaltPageState createState() => _EditArticaltPageState();
}

class _EditArticaltPageState extends State<EditArticaltPage> {

  TextEditingController textEditingController = new TextEditingController();
  FocusNode textFocusNode = new FocusNode();
  ImageGridState _imgState = ImageGridState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '写动态',
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(msg: '开发中！');
            },
            icon: Image(
              image: AssetImage("assets/icon/yes.png"),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: builEditWidget(),
    );
  }

  Widget builEditWidget() {
    return ListView(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(15.0, 15.0, 0, 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icon/girl.png"),
                    ),
                  ),
                  width: 40.0,
                  height: 40.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Haley",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: '分享新鲜事...',
              border: InputBorder.none,
            ),
            maxLines: 6,
            minLines: 3,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ImageGridWidget(myState:_imgState),
      ],
    );
  }
}