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
          title: Text('Text示例'),
          centerTitle: true,
        ),
      body: Container(
        color: Colors.amber,
        // '今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，今天天气不好，',
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text.rich(TextSpan(
          text: 'hello',
          style: TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.bold,),
          children: [
            TextSpan(
              text: ' world',
              style: TextStyle(fontSize: 40,color: Colors.blue,fontWeight: FontWeight.bold,),
            ),
            TextSpan(
              text: ' 你好',
              style: TextStyle(fontSize: 40,color: Colors.green,fontWeight: FontWeight.bold,),
            ),
            TextSpan(
              text: '!',
              style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,),
            ),
          ],
        )),


        // child: Text(
        // style: TextStyle(fontSize: 30,color: Colors.blue,),
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // ),

        // child: Text(
          // 'hello world',
          // style: TextStyle(fontSize: 30,color: Colors.blue,fontStyle: FontStyle.italic,decoration: TextDecoration.lineThrough,decorationColor: Colors.red,decorationThickness: 2,),
        // )
      )
      

      ),
    );
  }
}
