import 'package:flutter/material.dart';

class RankList extends StatefulWidget{
  @override
  _RankListState createState(){
    return _RankListState();
  }
}

class _RankListState extends State<RankList>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context,index){
        if(index.isOdd){
          return Divider();
        }
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/head2.png'),
              ),
            ),
            width: 40.0,
            height: 40.0,
          ),
          title: Text('用户$index'),
          subtitle: Text('0.0 L'),
          trailing: Text(
            '$index',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
