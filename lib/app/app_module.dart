import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_test/modules/splash/splash_export.dart';

import '../modules/details_municipalities/details_municipalities_module.dart';
import '../modules/home/home_module.dart';
import '../shared/utils/constants/app_routes.dart';

class AppModule extends Module {
  AppModule();

  Dio getDioConfig() {
    var options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 2000),
      receiveTimeout: const Duration(
        milliseconds: 6000,
      ),
    );
    Dio dio = Dio(options);
    return dio;
  }

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(AppRoutes.splash, module: SplashModule());
    r.module(AppRoutes.home, module: HomeModule());
    r.module(AppRoutes.details, module: DetailsMunicipalitiesModule());
  }

  @override
  final List<Module> imports = [];
}
