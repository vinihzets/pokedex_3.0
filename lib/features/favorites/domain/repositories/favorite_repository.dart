import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<PokemonEntity>>> getFavorites();
}
