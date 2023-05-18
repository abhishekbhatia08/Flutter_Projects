import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();
  API() {
    _dio.options.baseUrl =
        'https://fakestoreapi.com/';
    _dio.interceptors.add(PrettyDioLogger());
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['Authorization'] = '';
    _dio.options.headers['Accept'] = 'application/json';
  }

  Dio get sendRequest => _dio;
}
