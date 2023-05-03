import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_3/features/home/domain/repositories/home_repository.dart';

import '../../../../core/architeture/usecase.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonUrl(
      IndexApiParams params) async {
    try {
      final fetchRequest = await dataSources.fetchPokemonUrl(params);

      return Right(fetchRequest);
    } on HttpException catch (e) {
      return Left(RemoteFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonTypeUrl(
      TypeParams params) async {
    try {
      final fetchRequest = await dataSources.fetchPokemonsUrlByType(params.url);

      return Right(fetchRequest);
    } on HttpException catch (e) {
      return Left(RemoteFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final signOutRequest = await dataSources.signOut();

      return Right(signOutRequest);
    } on FirebaseAuthException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
