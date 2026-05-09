import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage()); 
}
//练习代码
// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Text('父组件',style: TextStyle(fontSize: 30,color: Colors.blue)),
//               // Child(message:'老高'),
//               Child(message:'老高真棒'),
//             ],
//           )
//         ),
//       ),
//     );
//   }
// } 
// // //无状态组件子组件  无状态对内
// // class Child extends StatelessWidget {
// //   final String message;  //子组件接收父组件传递过来的消息
// //   const Child({Key? key, required this.message}) : super(key: key); ///子组件构造函数，接受消息

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Text('子组件-$message',style: TextStyle(fontSize: 20,color: Colors.red)),
// //     );
// //   }
// // }

// //有状态组件子组件  有状态对外
// class Child extends StatefulWidget {
//   final String message;  //子组件接收父组件传递过来的消息
//   const Child({Key? key, required this.message}) : super(key: key); //required 表示必须传递消息

//   @override
//   _ChildState createState() => _ChildState();
// }

// class _ChildState extends State<Child> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('子组件-${widget.message}',style: TextStyle(fontSize: 20,color: Colors.red)),
//     );
//   }
// }

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
            return Child(message: list[index]); //返回子组件
          })
          )
      )
    );
  }
}
//子组件
class Child extends StatefulWidget {
  final String message;  //子组件接收父组件传递过来的消息
  const Child({Key? key, required this.message}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(widget.message,style: TextStyle(fontSize: 20,color: Colors.white)),
    );
  }
}