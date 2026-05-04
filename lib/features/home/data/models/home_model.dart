import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/features/home/data/models/locale.dart';

part 'home_model.g.dart';

@HiveType(typeId: 0)
class HomeModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;
  @HiveField(2)
  final List<Locale>? locales;

  HomeModel({
    required this.title,
    required this.description,
    this.locales,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        title: json['title'],
        description: json['description'],
        locales: (json['locales'] as List<dynamic>?)
            ?.map((e) => Locale.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
