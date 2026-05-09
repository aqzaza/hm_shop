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
    //注册路由表
    return MaterialApp(
      initialRoute: "/list",
      routes: {
        "/list": (context) => ListPage(),
        "/detail": (context) => DetailPage(),
      },
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
            // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
            Navigator.pushNamed(context, "/detail",arguments: {   //arguments 传递参数
              "id": index + 1
            });
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
  String _id = "";
  //initstate 获取不了路由参数,需要放置在future.microtask中
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
      if (ModalRoute.of(context) != null) {
        //可以获取路由参数
        Map<String, dynamic> params = 
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        print(params["id"]);
        _id = params["id"].toString();
        setState(() {});
      }
      else{
        print("没有参数");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: (){
            //返回列表页
              Navigator.pushNamed(context, "/list");
            }, 
            child: Text("返回详情页$_id")),
            TextButton(onPressed: (){
            //返回列表页
              Navigator.pop(context);
            }, 
            child: Text("返回上一个页面"))
          ],
        )
        

      )
    );
  }
}