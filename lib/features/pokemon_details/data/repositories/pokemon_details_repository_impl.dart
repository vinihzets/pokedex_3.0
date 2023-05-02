import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/pokemon_details/data/datasources/pokemon_details_datasources.dart';
import 'package:pokedex_3/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  PokemonDetailsDataSources dataSources;

  PokemonDetailsRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, void>> addFavorites(PokemonEntity pokemon) async {
    try {
      final dbAdd = await dataSources.addFavorites(pokemon);

      return Right(dbAdd);
    } on Exception catch (_) {
      return Left(RemoteFailure(message: 'Este pokemon ja esta favoritado'));
    }
  }
}
