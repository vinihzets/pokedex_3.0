import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/aleatory_pokemon/data/datasources/aleatory_pokemon_datasources.dart';
import 'package:pokedex_3/features/aleatory_pokemon/domain/repositories/aleatory_pokemon_repository.dart';

class AleatoryPokemonRepositoryImpl implements AleatoryPokemonRepository {
  AleatoryPokemonDataSources dataSources;

  AleatoryPokemonRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, PokemonEntity>> fetchAleatory() async {
    try {
      final fetchRequest = await dataSources.fetchAleatory();

      return Right(fetchRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> caught(PokemonEntity pokemon) async {
    try {
      final caughtRequest = await dataSources.caughtPokemon(pokemon);

      return Right(caughtRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
