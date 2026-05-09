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
          title: Text('padding示例'),
          centerTitle: true,
        ),
        
        body: Container(
          // padding: EdgeInsets.all(20),
          // color: Colors.amber,
          decoration: BoxDecoration(color: Colors.amber,),
          child: Padding(
            // padding: EdgeInsets.all(20),
            // padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            child: Container(
              color: Colors.blue,
            ),
          )
        )

        
      ),
    );
  }
}
