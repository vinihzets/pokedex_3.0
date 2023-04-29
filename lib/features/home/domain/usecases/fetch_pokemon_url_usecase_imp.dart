import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';

class FetchPokemonUrlUseCaseImpl
    implements UseCase<IndexApiParams, List<UrlEntity>> {
  HomeRepository repository;

  FetchPokemonUrlUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<UrlEntity>>> call(IndexApiParams params) {
    return repository.fetchPokemonsUrl(params);
  }
}

class IndexApiParams {
  int currentIndex;
  int limit;

  IndexApiParams(this.currentIndex, this.limit);
}
