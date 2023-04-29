import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/login/domain/repositories/login_repository.dart';

class SignInUseCaseImpl implements UseCase<UserParams, UserCredential> {
  LoginRepository repository;

  SignInUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(UserParams params) {
    return repository.signIn(params);
  }
}

class UserParams {
  String email;
  String password;

  UserParams(this.email, this.password);
}
