import 'dart:io';

import 'package:diandishui/model/my_image.dart';
import 'package:diandishui/module/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class ImageGridWidget extends StatefulWidget {

  final ImageGridState myState;

  ImageGridWidget({Key key, this.myState}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    //_state = ImageGridState();
    return myState;
  }
}

class ImageGridState extends State<ImageGridWidget> {
  List<MyImage> images = [];
  String _movingValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      String uuid = Uuid().v1();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var gradWidth = width - 40;
    var itemWidth = gradWidth / 3;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: gradWidth,
      height: gradWidth,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1),
        children: buildItems(itemWidth),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  List<Widget> buildItems(var itemWidth) {
    List<Widget> items = [];
    images.forEach((myImage) {
      items.add(draggableItem(itemWidth, myImage.uuid));
    });
    items.add(pickerImageButton(itemWidth));
    return items;
  }

  // 生成可拖动的item
  Widget draggableItem(itemWidth, value) {
    return Draggable(
      data: value,
      child: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return baseItem(itemWidth, value, Colors.white);
        },
        onWillAccept: (moveData) {
          var accept = moveData != null;
          if (accept) {
            exchangeItem(moveData, value, false);
          }
          return accept;
        },
        onAccept: (moveData) {
          exchangeItem(moveData, value, true);
        },
        onLeave: (moveData) {},
      ),
      feedback: baseItem(itemWidth, value, Colors.white.withOpacity(0.8)),
      childWhenDragging: null,
      onDragStarted: () {
        setState(() {
          _movingValue = value;
        });
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        setState(() {
          _movingValue = null;
        });
      },
      onDragCompleted: () {},
    );
  }

  MyImage getMyImageByUuid(String uuid) {
    for (int i = 0; i < images.length; ++i) {
      if (images[i].uuid.compareTo(uuid) == 0) {
        return images[i];
      }
    }
    return null;
  }

  Widget baseItem(itemWidth, value, bgColor) {
    if (value == _movingValue) {
      return Container();
    }
    String path = getMyImageByUuid(value).path;

    return Container(
      width: itemWidth,
      height: itemWidth,
      color: bgColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 500,
            width: 500,
            child: Image.file(File(path), fit: BoxFit.cover),
          ),
          Positioned(
            right: 0.08,
            top: 0.08,
            child: new GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: GestureDetector(
                  child: Icon(
                    Icons.close_sharp,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () {
                    setState(() {
                      images.remove(getMyImageByUuid(value));
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void exchangeItem(moveData, toData, onAccept) {
    setState(() {
      MyImage toMyImage = getMyImageByUuid(toData);
      var toIndex = images.indexOf(toMyImage);

      MyImage moveMyImage = getMyImageByUuid(moveData);
      images.remove(moveMyImage);
      images.insert(toIndex, moveMyImage);
      if (onAccept) {
        _movingValue = null;
      }
    });
  }

  Widget pickerImageButton(
    itemWidth,
  ) {
    return GestureDetector(
      onTap: loadImages,
      behavior: HitTestBehavior.opaque,
      child: Container(
          width: itemWidth,
          height: itemWidth,
          color: greyF3F3F3,
          child:
              Icon(Icons.add_a_photo, color: greyCCCCCC, size: itemWidth / 3)),
    );
  }

  Future<void> loadImages() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([
      PermissionGroup.location,
      PermissionGroup.camera,
      PermissionGroup.storage
    ]);
    if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
      print('没有拍照权限');
      return;
    }
    if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
      print('没有存储权限');
      return;
    }
    if (images.length >= 9) {
      return;
    }
    List<Media> res;

    try {
      res = await ImagesPicker.pick(
        count: 9,
        pickType: PickType.all,
        language: Language.System,
        // maxSize: 500,
      );
    } on Exception {}
    if (!mounted) return;

    if (res == null) return;
    setState(() {
      for (Media media in res) {
        String uuid = Uuid().v1();
        images.add(MyImage(media.path, uuid));
      }
    });
  }
}
