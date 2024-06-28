import '../../../core/resources/data_state.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  });
  Future<DataState<List<UserEntity>>> getUsers({
    required String accessToken,
    bool orderByAlphabets = false,
    String? search,
    int limit = 10,
    int page = 1,
  });

  /*Future<DataState<DataResponseEntity>> setUser(UserModel user);*/

  /*Future<DataState<UserEntity>> updateUser(UserModel user);*/
}
