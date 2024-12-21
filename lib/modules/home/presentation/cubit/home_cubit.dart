import 'package:flutter/material.dart';

import '../../../../shared/utils/dependencies/dependencies_export.dart';
import '../../domain/usecases/home_usecase.dart';
import 'states/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase useCase;
  final ScrollController scrollController = ScrollController();

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
        paginate();
      },
    );
  }

  void paginate({int? page}) {
    final currentPage = page ?? state.currentPage;
    final startIndex = (currentPage - 1) * state.pageSize;
    final endIndex = startIndex + state.pageSize;

    final displayedEntities = state.districtEntity.sublist(
      startIndex,
      endIndex > state.districtEntity.length
          ? state.districtEntity.length
          : endIndex,
    );

    emit(state.copyWith(
      currentPage: currentPage,
      displayedEntities: displayedEntities,
    ));
  }

  void loadMore() {
    if (state.isLoadingMore || state.displayedEntities.length == state.districtEntity.length) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final startIndex = (nextPage - 1) * state.pageSize;
    final endIndex = startIndex + state.pageSize;

    final moreItems = state.districtEntity.sublist(
      startIndex,
      endIndex > state.districtEntity.length ? state.districtEntity.length : endIndex,
    );

    emit(state.copyWith(
      isLoadingMore: false,
      currentPage: nextPage,
      displayedEntities: List.from(state.displayedEntities)..addAll(moreItems),
    ));
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent &&
        !state.isLoadingMore) {
      loadMore();
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

}
