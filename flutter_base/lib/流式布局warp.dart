
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

List<Widget> getList(){
    // return [];
    return List.generate(10,(index){
      return Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('warp示例'),
          centerTitle: true,
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: getList(),
        ),
      )
      

      ),
    );
  }
}
