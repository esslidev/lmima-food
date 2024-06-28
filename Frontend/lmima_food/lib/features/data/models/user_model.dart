import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart'; // Adjust the path as per your project structure

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.email,
    super.password,
    super.firstName,
    super.lastName,
    super.imageUrl,
    super.createdAt,
    super.updatedAt,
  });

  // Factory method to deserialize from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Method to serialize to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
