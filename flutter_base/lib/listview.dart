
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
        body: ListView.separated(
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (context, index) {
          return Container(color: Colors.blue,height: 80,width: double.infinity,child: Text('我是第${index+1}个',style: TextStyle(fontSize: 30,color: Colors.white),),alignment: Alignment.center,);
        },
          separatorBuilder: (context, index) {
            return Container(height: 10,color: Colors.yellow,
          );
          },
          itemCount: 100)

        // body: ListView.builder(   //适用于有限数据一次性构建所有表项目，  处理长列表或动态数据用builder模式   需要分割用seperated模式
        //   // controller: _controller,
        //   itemCount: 100,
        //   itemBuilder: (context, index) {
        //     return Container(margin: EdgeInsets.only(top: 10),color: Colors.blue,height: 80,width: double.infinity,child: Text('我是第${index+1}个',style: TextStyle(fontSize: 30,color: Colors.white),),alignment: Alignment.center,);
        //   },
        //   padding: EdgeInsets.all(20),
        //   // children: List.generate(100, (index) => Container(margin: EdgeInsets.only(top: 10),color: Colors.blue,height: 80,width: double.infinity,child: Text('我是第${index+1}个',style: TextStyle(fontSize: 30,color: Colors.white),),alignment: Alignment.center,)),
        // )

      )
    );
  }
}
