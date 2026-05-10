import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    //必须是sliver家族的组件
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text("商品$index",style: TextStyle(color: Colors.white),),
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}