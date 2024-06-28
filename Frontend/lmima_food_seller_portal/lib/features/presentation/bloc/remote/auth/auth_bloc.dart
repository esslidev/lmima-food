import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final AuthUseCases _authUseCases;

  RemoteAuthBloc(this._authUseCases) : super(const RemoteAuthInitial()) {
    on<SignIn>(onSignIn);
  }

  void onSignIn(SignIn event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthSigningIn());
    final dataState = await _authUseCases.signIn(event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteAuthSignedIn(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }
}
