part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final HomeEntity? home;
  final String? failure;
  const HomeState({this.status = HomeStatus.initial, this.home, this.failure});
  HomeState copyWith({
    HomeStatus? status,
    HomeEntity? home,
    String? failure,
  }) =>
      HomeState(
          status: status ?? this.status,
          home: home ?? this.home,
          // Not carried over: a new state without a failure clears the old one.
          failure: failure);
  @override
  List<Object?> get props => [status, home, failure];
}
