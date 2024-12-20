import 'package:dio/dio.dart';

import '../../../../shared/utils/constants/backend_routes.dart';
import '../../../../shared/utils/dio/dio_client.dart';
import '../../../../shared/utils/dio/enum/dio_method.dart';
import '../../../../shared/utils/errors/errors.dart';
import '../../domain/entities/locations_entity.dart';
import '../dtos/locations_entity_dto.dart';

abstract class HomeDatasource {
  Future<List<DistrictEntity>> call();
}

class HomeDatasourceImpl implements HomeDatasource {
  DioClient dioClient;

  HomeDatasourceImpl(this.dioClient);

  @override
  Future<List<DistrictEntity>> call() async {
    final response = await dioClient.request(
      url: BackendRoutes.locations,
      params: {'orderBy': "nome",},
      method: DioMethod.get,
      useToken: false,
    );
    try {
      final jsonResult = response.body!['data'];
      List<dynamic> listaItens = jsonResult as List;

      if (listaItens.isEmpty) {
        return [];
      }

      List<DistrictEntity> list = listaItens
          .map((item) => DistrictModel.fromMap(item))
          .toList();

      return list;
    } on DioException catch (e) {
      var error = e.response!.data;
      throw AppError(
        message: error['message'],
      );
    }
  }
}
