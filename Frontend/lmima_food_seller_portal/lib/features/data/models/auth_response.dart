import '../../domain/entities/auth_response.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    super.accessToken,
    super.renewToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'],
      renewToken: json['renewToken'],
    );
  }
}
