import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/register/data/datasources/register_datasources.dart';
import 'package:pokedex_3/features/register/domain/repositories/register_repository.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterDataSources dataSources;

  RegisterRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, UserCredential>> signUp(RegisterParams params) async {
    try {
      final registerRequest = await dataSources.signUp(params);
      return Right(registerRequest);
    } on FirebaseAuthException catch (ex) {
      return Left(RemoteFailure(message: ex.message ?? 'erro ao se cadastrar'));
    }
  }
}
