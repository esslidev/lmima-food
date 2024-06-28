import '../../../core/resources/data_state.dart';
import '../entities/user.dart';
import '../repository/user.dart';

class UserUseCases {
  final UserRepository repository;

  UserUseCases(this.repository);

  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  }) async {
    return await repository.getUser(accessToken: accessToken);
  }

  Future<DataState<List<UserEntity>>> getUsers({
    required String accessToken,
    bool orderByAlphabets = false,
    String? search,
    int limit = 10,
    int page = 1,
  }) async {
    return await repository.getUsers(
        accessToken: accessToken,
        orderByAlphabets: orderByAlphabets,
        search: search,
        limit: limit,
        page: page);
  }

  /*Future<DataState<DataResponseEntity>> setUser(UserModel user) async {
    return await repository.setUser(user);
  }*/

  /*Future<DataState<UserEntity>> updateUser(UserModel user) async {
    return await repository.updateUser(user);
  }*/
}
