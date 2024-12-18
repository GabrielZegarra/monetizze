import 'package:flutter/foundation.dart';


class AppLog {
  final String? message;
  const AppLog({this.message = 'Não foi possível completar a solicitação'});

  static logResponse({int? code, String? request, String? response, String? params, String? body,} ) {
    if (kDebugMode) {
      print(
          'StatusCode: $code \n'
          'Params : $params \n'
          'Body : $body \n'
          'Request: $request \n'
          'Response: $response',
        );
    }
  }
}
