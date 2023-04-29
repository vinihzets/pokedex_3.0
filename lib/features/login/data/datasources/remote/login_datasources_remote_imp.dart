import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/features/login/data/datasources/login_datasources.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';

class LoginDataSourcesRemoteImpl implements LoginDataSources {
  AuthService authService;

  LoginDataSourcesRemoteImpl(this.authService);

  @override
  Future<UserCredential> signIn(UserParams params) async {
    final loginRequest = await authService.auth.signInWithEmailAndPassword(
        email: params.email, password: params.password);
    return loginRequest;
  }
}
