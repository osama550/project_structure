import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/features/home/domain/entities/home_entity.dart';

part 'locale.g.dart';

@HiveType(typeId: 1)
class Locale extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? locale;

  Locale({
    this.id,
    this.name,
    this.description,
    this.locale,
  });

  HomeLocaleEntity toEntity() => HomeLocaleEntity(
        id: id,
        name: name,
        description: description,
        locale: locale,
      );

  factory Locale.fromJson(Map<String, dynamic> json) => Locale(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locale: json["locale"],
      );
}
