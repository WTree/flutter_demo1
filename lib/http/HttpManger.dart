import 'package:dio/dio.dart';

class HttpManger {
  factory HttpManger() => _getInstance();

  static HttpManger get instance => _getInstance();

  static HttpManger _instance;

  HttpManger._internal() {}

  static HttpManger _getInstance() {
    if (_instance == null) {
      _instance = new HttpManger._internal();
    }
    return _instance;
  }

  var dio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));
}
