import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepos) : super(const HomeState());
  final HomeRepos _homeRepos;

  Future<void> getHomeData() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _homeRepos.getHomeData();
    result.fold((l) => emit(state.copyWith(failure: l.errorMessage)), (r) {
      emit(state.copyWith(status: HomeStatus.success, homeModel: r));
    });
  }
}
