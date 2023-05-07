import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class AleatoryPokemonRepository {
  Future<Either<Failure, PokemonEntity>> fetchAleatory();
  Future<Either<Failure, dynamic>> caught(PokemonEntity pokemon);
}
