import '../../../../../shared/utils/states/global_state.dart';
import '../../../../home/domain/entities/locations_entity.dart';

class DetailsMunicipalitiesState implements GlobalState {
  final DistrictEntity? districtEntity;
  bool isLoading;
  bool success;
  bool successUpload;
  final String errorMessage;

  DetailsMunicipalitiesState({
    this.districtEntity,
    this.isLoading = false,
    this.success = false,
    this.successUpload = false,
    this.errorMessage = '',
  });

  DetailsMunicipalitiesState copyWith({
    DistrictEntity? districtEntity,
    bool? isLoading,
    bool? success,
    bool? successUpload,
    String? errorMessage,
  }) {
    return DetailsMunicipalitiesState(
      districtEntity: districtEntity ?? this.districtEntity,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      successUpload: successUpload ?? this.successUpload,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  DetailsMunicipalitiesState initial() {
    return DetailsMunicipalitiesState(
      districtEntity: null,
      isLoading: false,
      success: false,
      successUpload: false,
      errorMessage: '',
    );
  }

  DetailsMunicipalitiesState loading() {
    return DetailsMunicipalitiesState(
      isLoading: true,
      success: success,
      districtEntity: null,
      successUpload: successUpload,
      errorMessage: '',
    );
  }
}
