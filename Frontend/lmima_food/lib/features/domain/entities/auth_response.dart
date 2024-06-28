import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String? accessToken;
  final String? renewToken;

  const AuthResponseEntity({
    this.accessToken,
    this.renewToken,
  });

  @override
  List<Object?> get props => [accessToken, renewToken];
}
