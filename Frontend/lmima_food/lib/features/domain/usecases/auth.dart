import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/auth_response.dart';
import '../repository/auth.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases(this.authRepository);

  Future<DataState<AuthResponseEntity>> signIn(UserModel user) async {
    return await authRepository.signIn(user);
  }
}
