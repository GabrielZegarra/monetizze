import '../../../../../shared/utils/states/global_state.dart';
import '../../../domain/entities/locations_entity.dart';

class HomeState implements GlobalState {
  final List<DistrictEntity>? districtEntity;
  bool isLoading;
  bool success;
  bool successUpload;
  final String errorMessage;

  HomeState({
    this.districtEntity = const [],
    this.isLoading = false,
    this.success = false,
    this.successUpload = false,
    this.errorMessage = '',
  });

  HomeState copyWith({
    List<DistrictEntity>? districtEntity,
    bool? isLoading,
    bool? success,
    bool? successUpload,
    String? errorMessage,
  }) {
    return HomeState(
      districtEntity: districtEntity ?? this.districtEntity,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      successUpload: successUpload ?? this.successUpload,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  HomeState initial() {
    return HomeState(
      districtEntity: [],
      isLoading: false,
      success: false,
      successUpload: false,
      errorMessage: '',
    );
  }

  HomeState loading() {
    return HomeState(
      isLoading: true,
      success: success,
      districtEntity: [],
      successUpload: successUpload,
      errorMessage: '',
    );
  }
}
