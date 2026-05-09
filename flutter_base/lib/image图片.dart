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
          title: Text('center示例'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.amber,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          // child: Image.asset('lib/images/photo.jpg',height: 200,width: 200,fit: BoxFit.fill,),
          child: Image.network('https://picsum.photos/200/300?oto.jpg',height: 200,width: 200,fit: BoxFit.fill,alignment: Alignment.center,),

        ),

      

      ),
    );
  }
}
