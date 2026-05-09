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
          title: Text('row示例'),
          centerTitle: true,
        ),
        
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.amber,),
          child:Row(                                           //用于水平方向的布局，不支持滚动
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              // SizedBox(height: 20,),
              Container(
                // margin: EdgeInsets.only(top: 50),
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              // SizedBox(height: 20,),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          )
        )
      ),
    );
  }
}
