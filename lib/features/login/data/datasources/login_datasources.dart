import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';

abstract class LoginDataSources {
  Future<UserCredential> signIn(UserParams params);
}
