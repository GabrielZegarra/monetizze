import '../../../../shared/utils/dependencies/dependencies_export.dart';
import '../../../home/domain/entities/locations_entity.dart';
import '../../details_export.dart';

class DetailsMunicipalitiesCubit extends Cubit<DetailsMunicipalitiesState> {

  DetailsMunicipalitiesCubit() : super(DetailsMunicipalitiesState().initial());

  setMunicipalities(DistrictEntity? district) async {
    emit(state.copyWith(isLoading: true));
    if(district != null){
      emit(
        state.copyWith(
          isLoading: false,
          districtEntity: district,
          success: true,
        ),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}
