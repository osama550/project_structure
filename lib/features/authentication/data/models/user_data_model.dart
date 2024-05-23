import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String emailVerifiedAt;
  final String updatedAt;
  final String createdAt;
  final int id;
  final String token;
  final List<Restaurant> restaurants;

  const UserDataModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.token,
    required this.restaurants,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        emailVerifiedAt: json['email_verified_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        createdAt: json['created_at'] ?? '',
        id: json['id'] ?? 0,
        token: json['token'] ?? '',
        restaurants: (json['restaurants'] as List)
            .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
            .toList(),
      );

  @override
  List<Object?> get props {
    return [
      name,
      email,
      phone,
      emailVerifiedAt,
      updatedAt,
      createdAt,
      id,
      token,
      restaurants,
    ];
  }
}

class Restaurant {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final int userId;
  final dynamic passcode;
  final String? slug;
  final int creatorId;
  final String type;

  Restaurant({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.userId,
    required this.passcode,
    required this.slug,
    required this.creatorId,
    required this.type,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'] ?? 0,
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        name: json['name'] ?? '',
        userId: json['user_id'] ?? 0,
        passcode: json['passcode'],
        slug: json['slug'],
        creatorId: json['creator_id'] ?? 0,
        type: json['type'] ?? '',
      );
}
