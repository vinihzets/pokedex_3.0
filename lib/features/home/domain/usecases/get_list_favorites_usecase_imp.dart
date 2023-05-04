import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';

class GetFavoritesUseCaseImpl
    implements UseCase<NoParams, List<PokemonEntity>> {
  HomeRepository repository;

  GetFavoritesUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) {
    return repository.getFavorites();
  }
}
