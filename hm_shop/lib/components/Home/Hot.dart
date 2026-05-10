import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  HmHot({Key? key}) : super(key: key);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
       child: Text("爆款推荐",style: TextStyle(color: Colors.white),),
    );
  }
}