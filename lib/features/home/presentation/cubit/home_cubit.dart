import 'package:equatable/equatable.dart';
import 'package:project_structure/core/bloc/base_cubit.dart';
import 'package:project_structure/features/home/domain/entities/home_entity.dart';
import 'package:project_structure/features/home/domain/usecases/get_home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(this._getHome) : super(const HomeState());
  final GetHomeUseCase _getHome;

  Future<void> getHomeData() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _getHome();
    result.fold(
      (l) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          failure: l.errorMessage.toString(),
        ),
      ),
      (r) => emit(state.copyWith(status: HomeStatus.success, home: r)),
    );
  }
}
