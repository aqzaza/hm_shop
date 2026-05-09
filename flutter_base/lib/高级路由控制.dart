// 复杂场景，如根据参数动态生成界面或路由拦截 onGenerateRoute onUnknownRoute
// onGenerateRoute：根据路由参数动态生成界面
// onUnknownRoute：跳转一个未在路由表中注册、也未在onGenerateRoute中处理的路由时，调用此回调

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList": (context) => GoodsList(), //登录页和购物车列表页不在路由表里，而是在onGenerateRoute里处理
      },
      onGenerateRoute: (settings){
        print(settings.name);  //如果在routes中没有匹配到，进入这个函数
        if(settings.name == "/cartList"){
          bool isLogin = true;
          if(isLogin){
            return MaterialPageRoute(builder: (context) => CartList());
          }else{
            return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
      },
      //处理显示的是404页面
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => NotFound());
      },
    );
  }
}
//商品列表组件
class GoodsList extends StatefulWidget {
  GoodsList({Key? key}) : super(key: key);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品列表")),
      body: Center(
        child: TextButton(onPressed: (){
          // Navigator.pushNamed(context, "/cartList");
          Navigator.pushNamed(context, "abc");
        }, child: Text("加入购物车")),
      )
    );
  }
}
 //购物车列表
class CartList extends StatefulWidget {
  CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("购物车列表")),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text("去结算")),
      )
    );
  }
}

//登录页面
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录页面")),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text("去登录")),
      )
    );
  }
}

//404组件
class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("返回首页")),
    );
  }
}
