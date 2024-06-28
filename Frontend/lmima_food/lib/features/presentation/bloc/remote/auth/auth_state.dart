import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth_response.dart';

abstract class RemoteAuthState extends Equatable {
  final AuthResponseEntity? authResponse;
  final DioException? error;

  const RemoteAuthState({this.authResponse, this.error});

  @override
  List<Object> get props => [authResponse ?? '', error ?? ''];
}

// init user
class RemoteAuthInitial extends RemoteAuthState {
  const RemoteAuthInitial();
}

// loading user
class RemoteAuthSigningIn extends RemoteAuthState {
  const RemoteAuthSigningIn();
}

class RemoteAuthSignedIn extends RemoteAuthState {
  const RemoteAuthSignedIn(AuthResponseEntity? authResponse)
      : super(authResponse: authResponse);
}

class RemoteAuthError extends RemoteAuthState {
  const RemoteAuthError(DioException? error) : super(error: error);
}
