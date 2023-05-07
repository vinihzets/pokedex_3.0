import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/aleatory_pokemon/domain/repositories/aleatory_pokemon_repository.dart';

class CaughtAleatoryPokemonUseCaseImpl
    implements UseCase<PokemonCaughtParams, dynamic> {
  AleatoryPokemonRepository repository;

  CaughtAleatoryPokemonUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(PokemonCaughtParams params) {
    return repository.caught(params.pokemon);
  }
}
