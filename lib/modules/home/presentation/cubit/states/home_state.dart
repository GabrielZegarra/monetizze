import '../../../../../shared/utils/states/global_state.dart';
import '../../../domain/entities/locations_entity.dart';

class HomeState implements GlobalState {
  final List<DistrictEntity> districtEntity;
  final bool isLoadingMore;
  bool isLoading;
  bool success;
  bool successUpload;
  final String errorMessage;
  final List<DistrictEntity> displayedEntities;
  final int currentPage;
  final int pageSize;

  HomeState({
    this.districtEntity = const [],
    this.isLoadingMore = false,
    this.isLoading = false,
    this.success = false,
    this.successUpload = false,
    this.errorMessage = '',
    this.displayedEntities = const [],
    this.currentPage = 1,
    this.pageSize = 10,
  });

  HomeState copyWith({
    List<DistrictEntity>? districtEntity,
    bool? isLoadingMore,
    bool? isLoading,
    bool? success,
    bool? successUpload,
    String? errorMessage,
    List<DistrictEntity>? displayedEntities,
    int? currentPage,
    int? pageSize,
  }) {
    return HomeState(
      districtEntity: districtEntity ?? this.districtEntity,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      successUpload: successUpload ?? this.successUpload,
      errorMessage: errorMessage ?? this.errorMessage,
      displayedEntities: displayedEntities ?? this.displayedEntities,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  HomeState initial() {
    return HomeState(
      districtEntity: [],
      isLoadingMore: false,
      isLoading: false,
      success: false,
      successUpload: false,
      errorMessage: '',
      displayedEntities: [],
      currentPage: 1,
      pageSize: 10,
    );
  }

  HomeState loading() {
    return HomeState(
      isLoading: true,
      isLoadingMore: false,
      success: success,
      districtEntity: [],
      successUpload: successUpload,
      errorMessage: '',
      currentPage: 1,
      pageSize: 10,
    );
  }
}
