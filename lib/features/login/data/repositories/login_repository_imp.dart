import 'package:pokedex_3/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/login/data/datasources/login_datasources.dart';
import 'package:pokedex_3/features/login/domain/repositories/login_repository.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSources dataSources;

  LoginRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, UserCredential>> signIn(UserParams params) async {
    try {
      final loginRequest = await dataSources.signIn(params);
      return Right(loginRequest);
    } on FirebaseAuthMultiFactorException catch (e) {
      return Left(
          RemoteFailure(message: e.message ?? 'nao foi possivel fazer login'));
    } on FirebaseAuthException catch (e) {
      return Left(
          RemoteFailure(message: e.message ?? 'Nao foi possivel fazer login'));
    }
  }
}
