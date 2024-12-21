import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_test/modules/details_municipalities/presentation/cubit/details_municipalities_cubit.dart';
import 'package:monetizze_test/modules/details_municipalities/presentation/details_municipalities_page.dart';
import '../../shared/utils/dio/dio_base_options.dart';
import '../../shared/utils/dio/dio_client.dart';


class DetailsMunicipalitiesModule extends Module {

  @override
  void binds(i) {
    i.addInstance<DioClient>(DioClient(getDioConfig()));
    i.add<DetailsMunicipalitiesCubit>(DetailsMunicipalitiesCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => DetailsMunicipalitiesPage(districtEntity: r.args.data),
    );
  }
}
