import 'package:flutter/foundation.dart';

class Failure implements Exception {}

class AppError extends Failure {
  final String? message;
  AppError({this.message = 'Não foi possível completar a solicitação'});


  void logError({String? message, String? stackTrace, int? code, String? request,String? response} ) {
    if (kDebugMode) {
      print('Message: $message \n'
          'Code: $code \n'
          'Request: $request'
          'Response: $response',
        );
    }
  }
  void logErrorWithStakTrace({String? message, String? stackTrace, int? code, String? request} ) {
    if (kDebugMode) {
      print('Message: $message \n'
          'Stack Trace: $stackTrace \n'
          'Code: $code \n'
          'Request: $request',
      );
    }
  }
}
