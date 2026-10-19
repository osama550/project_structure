import 'package:project_structure/features/sample/domain/entities/sample_entity.dart';

class SampleModel {
  final String title;
  final String description;

  const SampleModel({required this.title, required this.description});

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
      );

  SampleEntity toEntity() =>
      SampleEntity(title: title, description: description);
}
