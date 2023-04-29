import 'dart:io';

import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonsUrl(
      IndexApiParams params) async {
    try {
      final fetchRequest = await dataSources.fetchPokemonUrl(params);

      return Right(fetchRequest);
    } on HttpException catch (e) {
      return Left(RemoteFailure(message: e.message));
    }
  }
}
