import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/favorites/domain/repositories/favorite_repository.dart';

class GetListFavoritesUseCaseImpl
    implements UseCase<NoParams, List<PokemonEntity>> {
  FavoriteRepository repository;

  GetListFavoritesUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) {
    repository.getFavorites();
  }
}
