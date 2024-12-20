import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../shared/utils/errors/errors.dart';
import '../../domain/entities/locations_entity.dart';
import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_datasources.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  const HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<AppError, List<DistrictEntity>>> call() async {
    try {
      final result = await datasource();
      return Right(result);
    } on AppError catch (e) {
      return Left(AppError(message: e.message));
    }
  }
}
