import 'package:bloc/bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  /// Ignores emits after the cubit is closed, so async work that finishes
  /// late (e.g. a response arriving after the screen is gone) doesn't throw.
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
