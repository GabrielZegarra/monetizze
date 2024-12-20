import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../shared/utils/errors/errors.dart';
import '../entities/locations_entity.dart';
import '../repositories/home_repositories.dart';

abstract class HomeUseCase {
  Future<Either<AppError, List<DistrictEntity>>> call();
}

class HomeUseCaseImpl implements HomeUseCase {
  final HomeRepository repository;

  HomeUseCaseImpl(this.repository);

  @override
  Future<Either<AppError, List<DistrictEntity>>> call() async {
    return await repository();
  }

}
