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
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _phoneController,
                onChanged: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: '请输入用户名',
                  labelText: '用户名',
                  fillColor: const Color.fromARGB(129, 228, 208, 154),
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(25))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  print(value);
                },
                controller: _codeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: '请输入密码',
                  labelText: '密码',
                  fillColor: const Color.fromARGB(129, 228, 208, 154),
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(25))
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(onPressed: (){
                  print("登录-${_phoneController.text}");
                  print("登录-${_codeController.text}");
                }, child: Text('登录',style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black),
              )  
            ],
          ),
        ),
      ),
    );
  }
}