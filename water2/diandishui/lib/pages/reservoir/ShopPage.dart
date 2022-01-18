import 'package:diandishui/model/commodityModel.dart';
import 'package:diandishui/module/text.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  _ShopPagePageState createState() => _ShopPagePageState();
}

class _ShopPagePageState extends State<ShopPage> {
  List<CommodityModel> commodityModels = [
    new CommodityModel(
        'assets/icon/primary_cleaner.png', "初级清洁工", "清理效果：伤害-40", 40.0),
    new CommodityModel(
        'assets/icon/intermediate_cleaner.png', "中级清洁工", "清理效果：伤害-70", 70.0),
    new CommodityModel(
        'assets/icon/senior_cleaner.png', "高级清洁工", "清理效果：伤害-100", 100.0),
    new CommodityModel(
        'assets/icon/super_cleaner.png', "特级清洁工", "清理效果：伤害-200", 200.0)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "商店",
          style: TextStyle(
            fontSize: titleSize,
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image(
                  image: AssetImage("assets/icon/coin.png"),
                ),
              ),
              Text(
                "40",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: commodityModels.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(commodityModels[index].head),
                        ),
                      ),
                      width: 40.0,
                      height: 40.0,
                    ),
                    title: Text(commodityModels[index].name),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            commodityModels[index].description,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    trailing:
                        Text("\$${commodityModels[index].price.toString()}"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("提示"),
                              content: Text("确定购买"+commodityModels[index].name+"?"),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text("确定"),
                                    onPressed: () => Navigator.pop(context, "cancel")),
                                FlatButton(
                                    child: Text("取消"),
                                    onPressed: () => Navigator.pop(context, "yes")),
                              ],
                            );
                          });
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            );
          }),
    );
  }

  _alertDialog() async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("确定要删除吗"),
            actions: <Widget>[
              FlatButton(
                  child: Text("取消"),
                  onPressed: () => Navigator.pop(context, "cancel")),
              FlatButton(
                  child: Text("确定"),
                  onPressed: () => Navigator.pop(context, "yes")),
            ],
          );
        });
    return alertDialogs;
  }
}
