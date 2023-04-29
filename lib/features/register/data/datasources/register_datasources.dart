import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';

abstract class RegisterDataSources {
  Future<UserCredential> signUp(RegisterParams params);
}
