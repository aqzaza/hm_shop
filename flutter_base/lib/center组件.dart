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
        
        body: Center(
          child: Container(
            // alignment: Alignment.center,
            width: 200,
            height: 200,
            color: Colors.blue,
            // child: Text('居中内容',style: TextStyle(color: Colors.white,fontSize: 20),),
            child: Center(
              child: Text('居中内容',style: TextStyle(color: Colors.white,fontSize: 20),),
            )
          )
        ),

        bottomNavigationBar: Container( //简单显示底部的文字：bottom
          height: 100,
          // color: Colors.blue,
          child: Center(
            child: Text('bottom',style: TextStyle(color: Colors.red,fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
