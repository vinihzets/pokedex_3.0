import 'package:dartz/dartz.dart';
import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<UrlEntity>>> fetchPokemonsUrl(
      IndexApiParams params);
}
