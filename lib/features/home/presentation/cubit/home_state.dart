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
  final HomeModel? homeModel;
  final String? failure;
  const HomeState(
      {this.status = HomeStatus.initial, this.homeModel, this.failure});
  HomeState copyWith({
    HomeStatus? status,
    HomeModel? homeModel,
    String? failure,
  }) =>
      HomeState(
          status: status ?? this.status,
          homeModel: homeModel ?? this.homeModel,
          failure: failure ?? this.failure);
  @override
  List<Object?> get props => [status, homeModel, failure];
}
