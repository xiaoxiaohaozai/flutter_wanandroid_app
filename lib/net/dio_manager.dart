import 'package:dio/dio.dart';
import 'dart:io';

//单例
class DioManager {
  Dio _dio;

  DioManager._internal() {
    //命名构造函数
    _dio = Dio();
  }

  static DioManager singleton = DioManager._internal();

  factory DioManager() {
    //返回已经存在的实例
    return singleton;
  }

  Dio get dio {
    return _dio;
  }
}
