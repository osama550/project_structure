import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String title;
  final String description;
  final List<HomeLocaleEntity> locales;

  const HomeEntity({
    required this.title,
    required this.description,
    this.locales = const [],
  });

  @override
  List<Object?> get props => [title, description, locales];
}

class HomeLocaleEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? locale;

  const HomeLocaleEntity({this.id, this.name, this.description, this.locale});

  @override
  List<Object?> get props => [id, name, description, locale];
}
