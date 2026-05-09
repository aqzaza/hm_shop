
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          transform: Matrix4.rotationZ(0.05),
          margin: EdgeInsets.all(20),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow,width: 3),
            color: Colors.blue, 
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text('hello world',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}
