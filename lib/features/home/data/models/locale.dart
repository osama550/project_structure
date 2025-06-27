import 'package:hive/hive.dart';

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

  factory Locale.fromJson(Map<String, dynamic> json) => Locale(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locale: json["locale"],
      );
}
