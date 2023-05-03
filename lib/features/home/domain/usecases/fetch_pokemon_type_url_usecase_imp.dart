import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';

class FetchPokemonUrlTypeUseCaseImpl
    implements UseCase<TypeParams, List<UrlEntity>> {
  HomeRepository repository;

  FetchPokemonUrlTypeUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<UrlEntity>>> call(TypeParams params) {
    return repository.fetchPokemonTypeUrl(params);
  }
}
