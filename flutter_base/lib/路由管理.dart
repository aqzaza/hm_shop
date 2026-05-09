//  基本路由 适用于页面不多、逻辑简单的场景

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MainPage());
}
//  路由管理-material风格，只能有一个materialapp实例
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ListPage(),  //列表页

    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表页")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            //列表到详情页
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                    },
          child: Container(
            color: Colors.blue,
            height: 100,
            margin: EdgeInsets.only(top: 10),
            child: Text("列表项${index+1}",
              style: TextStyle(color: Colors.white,fontSize: 20),),
            alignment: Alignment.center,
            )
        );
      })
    );
  }
}

// 详情页
class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Center(
        child: TextButton(onPressed: (){
          //返回列表页
          Navigator.pop(context);
        }, child: Text("返回列表页"))
      )
    );
  }
}