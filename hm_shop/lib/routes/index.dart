//管理路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

//返回App的根路由
Widget getRootWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: '/',
    routes: getRootRoutes(),
  );
}
//返回App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    //主页
    '/': (context) => MainPage(),
    //登录页
    '/login': (context) => LoginPage(),
  };
}