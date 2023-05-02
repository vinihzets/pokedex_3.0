import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';

class AddFavoritesUseCaseImpl implements UseCase<PokemonEntity, void> {
  PokemonDetailsRepository repository;

  AddFavoritesUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(PokemonEntity params) {
    return repository.addFavorites(params);
  }
}
