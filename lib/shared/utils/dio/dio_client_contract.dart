import 'package:dio/dio.dart';
import 'enum/dio_method.dart';
import 'models/dio_response.dart';

abstract class DioClientContract{
  Future<DioResponse> request({
    required String url,
    required DioMethod method,
    Map<String, dynamic>? params,
    dynamic body,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool? useToken,
  });

}