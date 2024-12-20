import 'package:dartz/dartz.dart';

import '../../../../shared/utils/errors/errors.dart';
import '../entities/locations_entity.dart';

abstract class HomeRepository {
  Future<Either<AppError, List<DistrictEntity>>> call();
}
