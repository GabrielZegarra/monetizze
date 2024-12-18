import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants/app_routes.dart';
import '../errors/errors.dart';
import '../log/AppLog.dart';
import 'dio_client_contract.dart';
import 'enum/dio_method.dart';
import 'models/dio_response.dart';

class DioClient implements DioClientContract {
  final Dio client;

  DioClient(
    this.client,
  );

  @override
  Future<DioResponse> request({
    required String url,
    required DioMethod method,
    Map<String, dynamic>? params,
    dynamic body,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    bool? useToken = false,
    bool? genericApis = false,
  }) async {
    String? token = '';
    var data;

    if (body is FormData) {
      data = body;
      method = DioMethod.post;
    } else {
      data = body;
    }
    var response = Response(statusCode: 500, requestOptions: RequestOptions(path: ''));

    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(await _getHeaders(token));

    final defaultOptions = options != null
        ? options.copyWith(
            method: method.name,
            headers: defaultHeaders,
          )
        : Options(
            method: method.name,
            headers: defaultHeaders,
          );
    try {
      switch (method) {
        case DioMethod.get:
          response = await client.get(
            url,
            queryParameters: params,
            options: defaultOptions,
            cancelToken: cancelToken,
          );
          break;
        case DioMethod.post:
          response = await client.post(url, data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        case DioMethod.put:
          response = await client.put(url, data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        case DioMethod.delete:
          response = await client.delete(url, data: data, options: defaultOptions, cancelToken: cancelToken);
          break;
        default:
          throw Failure();
      }
      if (kDebugMode) {
        AppLog.logResponse(
          request: response.requestOptions.path,
          params: params.toString(),
          body: body.toString(),
          response: response.data.toString(),
          code: response.statusCode,
        );
      }
    } catch (error) {
      if (error is DioException && error.response != null) {
        AppError().logError(
          message: error.message,
          code: error.response!.statusCode ?? 0,
          request: error.response!.requestOptions.path,
          response: error.response?.data.toString(),
        );
        _handleResponse(response: error.response!);
      } else {
        if (error == DioExceptionType.cancel) {
          throw AppError(message: 'Request canceled');
        } else {
          throw AppError(message: error.toString());
        }
      }
    }
    return _handleResponse(
      response: response,
    );
  }

  _handleResponse({
    required Response response,
  }) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        {
          if (response.data is String || response.data is List) {
            Map<String, dynamic> newResponse = {'data': response.data};
            response.data = newResponse;
          }
          if (response.data is! Map && response.data?.stream != null) {
            response.data = null;
          }
          return DioResponse(
            statusCode: response.statusCode!,
            body: (response.data == null) ? null : Map<String, dynamic>.from(response.data),
            header: response.headers.isEmpty ? null : Map<String, dynamic>.from(response.headers.map),
          );
        }
      case 204:
        return DioResponse(
          statusCode: response.statusCode!,
          body: null,
          header: response.headers.isEmpty ? null : Map<String, dynamic>.from(response.headers.map),
        );
      case 400:
        throw AppError(message: response.data['detail']);
      case 401:
        String message = response.data['detail'];
        throw AppError(message: response.data['detail']);
      case 403:
        throw AppError(message: response.data['detail']);
      case 404:
        throw AppError(message: response.data['detail']);
      case 422:
        throw AppError(message: response.data['detail']);
      case 500:
        String message = response.data['detail'];
        throw AppError(message: response.data['detail']);
      default:
        throw AppError();
    }
  }

  static Future<Map<String, String>> _getHeaders(String? token) async {
    Map<String, String> requestHeaders = {};
    if (token != null && token.isNotEmpty) {
      requestHeaders = {
        'accept': 'application/json, */*',
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      requestHeaders = {
        'accept': 'application/json, */*',
        'content-type': 'application/json',
      };
    }

    return requestHeaders;
  }
}