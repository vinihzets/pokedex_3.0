import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/register/domain/repositories/register_repository.dart';

class SignUpUseCaseImpl implements UseCase<RegisterParams, UserCredential> {
  RegisterRepository repository;

  SignUpUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(RegisterParams params) {
    return repository.signUp(params);
  }
}

class RegisterParams {
  String username;
  String email;
  String password;

  RegisterParams(this.username, this.email, this.password);
}
