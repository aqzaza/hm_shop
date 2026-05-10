import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 200,
      alignment: Alignment.center,
      child: Text("轮播图",style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }
}