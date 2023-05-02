import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';

class SignOutUseCaseImpl implements UseCase<NoParams, void> {
  HomeRepository repository;

  SignOutUseCaseImpl(this.repository);

  Future<Either<Failure, void>> call(NoParams params) {
    return repository.signOut();
  }
}

class NoParams {}
