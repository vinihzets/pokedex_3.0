import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserCredential>> signUp(RegisterParams params);
}
