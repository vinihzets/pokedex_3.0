import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';

import '../../../../core/architeture/usecase.dart';

abstract class HomeDataSources {
  Future<List<UrlEntity>> fetchPokemonUrl(IndexApiParams params);
  Future<PokemonEntity> fetchPokemonDetails(String pokemonUrl);
  Future<PokemonEntity> fetchPokemonBySearch(String pokemonName);
  Future<List<UrlEntity>> fetchTypeUrl();
  Future<List<UrlEntity>> fetchPokemonsUrlByType(String pokemonUrl);
  Future<void> signOut();
  Future<List<PokemonEntity>> getFavorites();
}
