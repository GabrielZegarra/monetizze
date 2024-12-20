import 'dart:io';

import '../../../../shared/utils/dependencies/dependencies_export.dart';
import '../../domain/usecases/home_usecase.dart';
import 'states/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase useCase;

  HomeCubit(this.useCase) : super(HomeState().initial());


  Future<void> getLocations() async {
    emit(state.copyWith(isLoading: true));
    final result = await useCase();
    result.fold(
          (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.message));
      },
          (success) {
        if (success.isEmpty) {
          return;
        }
        emit(
          state.copyWith(
            isLoading: false,
            districtEntity: success,
            success: true,
          ),
        );
      },
    );
  }
}
