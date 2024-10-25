
import 'package:json_annotation/json_annotation.dart';
part 'auth_user_model.g.dart';

@JsonSerializable()
class AuthUserModel {
  final String id;
  final String email;
  final String? name;
  final String? photoURL;

  const AuthUserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoURL,
  });
  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserModelToJson(this);
}
