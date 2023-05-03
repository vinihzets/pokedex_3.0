import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/favorites/data/datasources/favorite_datasources.dart';
import 'package:pokedex_3/features/favorites/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteDataSources dataSources;

  FavoriteRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, List<PokemonEntity>>> getFavorites() async {
    try {
      final getRequest = await dataSources.getFavorites();

      return Right(getRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
