import 'package:dio/dio.dart';

Dio  getDioConfig() {
  var options = BaseOptions(
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 30,),);
  Dio dio = Dio(options);
  return dio;
}