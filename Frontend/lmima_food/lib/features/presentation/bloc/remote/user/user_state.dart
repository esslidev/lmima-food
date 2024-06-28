import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/data_response.dart';
import '../../../../domain/entities/user.dart';

abstract class RemoteUserState extends Equatable {
  final UserEntity? user;
  final List<UserEntity>? users;
  final DataResponseEntity? response;
  final DioException? error;

  const RemoteUserState({this.user, this.users, this.error, this.response});

  @override
  List<Object> get props => [user ?? '', response ?? '', error ?? ''];
}

// init user
class RemoteUserInitial extends RemoteUserState {
  const RemoteUserInitial();
}

// loading user
class RemoteUserLoading extends RemoteUserState {
  const RemoteUserLoading();
}

class RemoteUserLoaded extends RemoteUserState {
  const RemoteUserLoaded(UserEntity user) : super(user: user);
}

class RemoteUsersLoading extends RemoteUserState {
  const RemoteUsersLoading();
}

class RemoteUsersLoaded extends RemoteUserState {
  const RemoteUsersLoaded(List<UserEntity> users) : super(users: users);
}

// saving user
class RemoteUserSaving extends RemoteUserState {
  const RemoteUserSaving();
}

class RemoteUserSaved extends RemoteUserState {
  const RemoteUserSaved(DataResponseEntity? response)
      : super(response: response);
}

// updating user
class RemoteUserUpdating extends RemoteUserState {
  const RemoteUserUpdating();
}

class RemoteUserUpdated extends RemoteUserState {
  const RemoteUserUpdated(UserEntity? user) : super(user: user);
}

class RemoteUserError extends RemoteUserState {
  const RemoteUserError(DioException? error) : super(error: error);
}
