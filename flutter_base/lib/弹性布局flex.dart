import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('center示例'),
          centerTitle: true,
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.amber,),
        child: Flex(
          // direction: Axis.vertical, //垂直方向的布局
          direction: Axis.horizontal, //水平方向的布局
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ), ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ), ),

            // Expanded(
            //   flex: 2,
            //   child: Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.red,
            // ), ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.green,
            // ), ),
          ],
        )
      ),
      

      ),
    );
  }
}
