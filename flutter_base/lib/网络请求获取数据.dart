import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/align%E6%96%87%E4%BB%B6.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  发起网络请求
    _getChannels();
  }

  void _getChannels() async{
    DioUtils util = DioUtils(); //创建实例化对象
      Response<dynamic> result = await util.get("channels");
      Map<String, dynamic> res = result.data as Map<String, dynamic>;
      List data = res["data"]["headers"] as List;
      // _list = data.cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理")),
        body: Text("内容"),
      ),
    );
  }
}


//封装一个工具类  基础地址、超时时间、拦截器、请求方法
class DioUtils{
  final Dio _dio = Dio();
  DioUtils(){
    //基础操作 配置地址和时间
    _dio.options.baseUrl = "https://geek.itheima.net/v1_0";
    _dio.options.connectTimeout = Duration(milliseconds: 5000);
    _dio.options.sendTimeout = Duration(milliseconds: 5000);
    _dio.options.receiveTimeout = Duration(milliseconds: 5000);

    addInterceptor();
  }
  void addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      //请求拦截器
      onRequest: (context, handler){
        handler.next(context);
      },
      //响应拦截器
      onResponse: (context, handler){
        //判断状态码是否为200
        if(context.statusCode! >= 200 && context.statusCode! < 300){
          handler.next(context);
          return;
        }else{
          //其他状态码
          handler.reject(DioException(requestOptions: context.requestOptions));
        }
      },
      //错误拦截器
      onError: (context, handler){
        handler.reject(context);
      },
    ));
  }
  //向外暴露get方法
  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}){
    return _dio.get(url, queryParameters: params);
  }

}

