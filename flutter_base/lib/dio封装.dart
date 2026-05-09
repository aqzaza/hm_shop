import 'package:dio/dio.dart';

void main(List<String> args) {
  

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
  get(String url, {Map<String, dynamic>? params}){
    return _dio.get(url, queryParameters: params);
  }

}

