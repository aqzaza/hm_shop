import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),

        body: Stack(
          children: [
            SingleChildScrollView(   //只能用一个scrollview，否则会报错
            controller: _controller,
            padding: EdgeInsets.all(20),
            child: Column(
          children: List.generate(100, (index) => Container(margin: EdgeInsets.only(top: 10),color: Colors.blue,height: 100,width: double.infinity,child: Text('我是第${index+1}个',style: TextStyle(fontSize: 30,color: Colors.white),),alignment: Alignment.center,)),
        ),
        ),
        //放置堆叠组件
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: (){
              // _controller.jumpTo(_controller.position.maxScrollExtent);
              _controller.animateTo(_controller.position.maxScrollExtent,duration: Duration(seconds: 10),curve: Curves.easeIn);
              // print('去底部');
            
              // print('去底部');
            },
          child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
          ),
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Text('去底部',style: TextStyle(color: Colors.white),),
        )
          )
),
        Positioned(
          right: 10,
          bottom: 10,
          child: GestureDetector(
            onTap: (){
              _controller.jumpTo(0);
              // print('去顶部');
            },
          child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
          ),
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Text('去顶部',style: TextStyle(color: Colors.white),),
        )
          )
),
          ],
        )

      )
    );
  }
}
