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
        color: Colors.amber,
        child:Flex(direction: Axis.vertical,
        children: [
          Container(color: Colors.blue,height: 100,),
          Expanded(child: Container(color: Colors.blueGrey,),),
          Container(color: Colors.red,height: 100,),
        ],
        )
      )
      

      ),
    );
  }
}
