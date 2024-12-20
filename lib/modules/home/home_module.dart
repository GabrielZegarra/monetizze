import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/utils/dio/dio_base_options.dart';
import '../../shared/utils/dio/dio_client.dart';
import 'data/datasources/home_datasources.dart';
import 'data/repositories/home_repositories_impl.dart';
import 'domain/repositories/home_repositories.dart';
import 'domain/usecases/home_usecase.dart';
import 'presentation/cubit/home_cubit.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {

  @override
  void binds(i) {
    i.addInstance<DioClient>(DioClient(getDioConfig()));
    i.add<HomeRepository>(HomeRepositoryImpl.new);
    i.add<HomeDatasource>(HomeDatasourceImpl.new);
    i.add<HomeUseCase>(HomeUseCaseImpl.new);
    i.add<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
    );
  }
}
