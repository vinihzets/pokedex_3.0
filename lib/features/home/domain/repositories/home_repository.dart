import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import '../../../../core/architeture/usecase.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonUrl(
      IndexApiParams params);
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonTypeUrl(
      TypeParams params);
  Future<Either<Failure, void>> signOut();
}
