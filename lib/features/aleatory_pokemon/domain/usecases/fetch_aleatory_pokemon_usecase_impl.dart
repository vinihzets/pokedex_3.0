
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/aleatory_pokemon/domain/repositories/aleatory_pokemon_repository.dart';

class FetchAleatoryPokemonUseCaseImpl
    implements UseCase<NoParams, PokemonEntity> {
  AleatoryPokemonRepository repository;

  FetchAleatoryPokemonUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, PokemonEntity>> call(NoParams params) {
    return repository.fetchAleatory();
  }
}
