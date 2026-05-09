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
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,   //最大宽度200
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,  //子项宽度与高度比例
          ),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount: 4,
          // mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
          // ), 
          itemCount: 100, 
          itemBuilder: (context,index){
          return Container(color: Colors.blue,height: 80,width: double.infinity,child: Text('第${index+1}个',style: TextStyle(fontSize: 20,color: Colors.white),),alignment: Alignment.center,);
        }
        )

        // body: GridView.count(  //创建固定列数网格
        //   crossAxisCount: 2,  // 2列
        //   padding: EdgeInsets.all(20),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   scrollDirection: Axis.horizontal,
        //   children: List.generate(100, (index) => Container(color: Colors.blue,height: 80,width: double.infinity,child: Text('第${index+1}个',style: TextStyle(fontSize: 20,color: Colors.white),),alignment: Alignment.center,)),
        // ),

      )
    );
  }
}
