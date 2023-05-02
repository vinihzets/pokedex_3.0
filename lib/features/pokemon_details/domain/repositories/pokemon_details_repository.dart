import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';

abstract class PokemonDetailsRepository {
  Future<Either<Failure, void>> addFavorites(PokemonEntity pokemon);
}
