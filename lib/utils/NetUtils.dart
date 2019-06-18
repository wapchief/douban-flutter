import 'dart:async';
import 'package:dio/dio.dart';

BaseOptions options=new BaseOptions(
    baseUrl: '',
    headers: {},
    );
//网络请求封装
Dio dio = new Dio();
Map<String, dynamic> headers;
class NetUtils {

  static Future get(String url,{Map<String,dynamic> params}) async{
    var response = await dio.get(url, queryParameters: params);
//    print(response.data);
    return  response.data;
  }

  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(url, data: params);
    return response.data;
  }
}