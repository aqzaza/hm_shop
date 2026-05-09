import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage()); 
}

//父组件
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> list = ['鱼香肉丝','宫保鸡丁','京酱肉丝','麻婆豆腐','溜肉段'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(list.length, (int index){
            return Child(message: list[index],index: index,
            delFood: (int index) {
              // list.removeAt(index);
              setState(() {
                list.removeAt(index);
              });
            },); //返回子组件
          })
          )
      )
    );
  }
}
//子组件
class Child extends StatefulWidget {
  final String message;  //子组件接收父组件传递过来的消息
  final int index;  //子组件接收父组件传递过来的索引
  final Function(int index) delFood;  //子组件接收父组件传递过来的删除函数
  const Child({Key? key, required this.message, required this.index, required this.delFood}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(widget.message,style: TextStyle(fontSize: 20,color: Colors.white)),
        ),
        IconButton(
          color: Colors.red,
          onPressed: (){
            widget.delFood(widget.index);
          },
          icon: Icon(Icons.delete)
          )
      ],
    );
  }
}