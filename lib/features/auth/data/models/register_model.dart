
import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel  {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const RegisterModel ({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
