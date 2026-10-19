part of 'sample_cubit.dart';

enum SampleStatus { initial, loading, success, failure }

extension SampleStatusX on SampleStatus {
  bool get isInitial => this == SampleStatus.initial;
  bool get isLoading => this == SampleStatus.loading;
  bool get isSuccess => this == SampleStatus.success;
  bool get isFailure => this == SampleStatus.failure;
}

class SampleState extends Equatable {
  final SampleStatus status;
  final SampleEntity? sample;
  final String? failure;
  const SampleState({
    this.status = SampleStatus.initial,
    this.sample,
    this.failure,
  });

  SampleState copyWith({
    SampleStatus? status,
    SampleEntity? sample,
    String? failure,
  }) =>
      SampleState(
        status: status ?? this.status,
        sample: sample ?? this.sample,
        // Not carried over: a new state without a failure clears the old one.
        failure: failure,
      );

  @override
  List<Object?> get props => [status, sample, failure];
}
