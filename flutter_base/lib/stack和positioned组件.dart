
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
          title: Text('stack示例'),
          centerTitle: true,
        ),
      body: Container(
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              width: 200,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ),
            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   right: 0,
            //   left: 0,
            //   child: Container(
            //     color: Colors.green,
            //     height: 50,
            //     width: 50,
            //   ),
            // ),
          ],
        ),

      //stack基础使用示例  
      //   child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Container(
      //       width: 300,
      //       height: 300,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       width: 100,
      //       height: 100,
      //       color: Colors.amber,
      //     )
      //   ]
      // ),
      

      ),
    ),
    );
  }
}
