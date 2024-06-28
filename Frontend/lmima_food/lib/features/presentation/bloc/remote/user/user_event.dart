import '../../../../data/models/user_model.dart';

abstract class RemoteUserEvent {
  const RemoteUserEvent();
}

class GetUser extends RemoteUserEvent {
  final String accessToken;

  const GetUser({
    required this.accessToken,
  });
}

class GetUsers extends RemoteUserEvent {
  String accessToken;
  bool orderByAlphabets;
  String? search;
  int limit;
  int page;

  GetUsers(
      {required this.accessToken,
      this.orderByAlphabets = false,
      this.search,
      this.limit = 10,
      this.page = 1});
}

class SetUser extends RemoteUserEvent {
  final UserModel user;

  SetUser(this.user);
}

class UpdateUser extends RemoteUserEvent {
  final UserModel user;

  UpdateUser(this.user);
}
