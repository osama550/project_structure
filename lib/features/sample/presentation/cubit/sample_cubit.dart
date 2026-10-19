import 'package:equatable/equatable.dart';
import 'package:project_structure/core/bloc/base_cubit.dart';
import 'package:project_structure/features/sample/domain/entities/sample_entity.dart';
import 'package:project_structure/features/sample/domain/repositories/sample_repos.dart';

part 'sample_state.dart';

class SampleCubit extends BaseCubit<SampleState> {
  SampleCubit(this._repos) : super(const SampleState());
  final SampleRepos _repos;

  Future<void> getSample() async {
    emit(state.copyWith(status: SampleStatus.loading));
    final result = await _repos.getSample();
    result.fold(
      (l) => emit(
        state.copyWith(status: SampleStatus.failure, failure: l.errorMessage),
      ),
      (r) => emit(state.copyWith(status: SampleStatus.success, sample: r)),
    );
  }
}
