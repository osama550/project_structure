import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  final String title;
  final String description;

  const SampleEntity({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];
}
