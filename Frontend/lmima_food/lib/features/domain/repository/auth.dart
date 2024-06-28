import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/auth_response.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> signIn(UserModel user);
  Future<DataState<AuthResponseEntity>> renewAccess(String renewToken);
}
