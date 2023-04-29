import 'package:pokedex_3/features/home/data/mappers/url_mapper.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';

abstract class HomeDataSources {
  Future<List<UrlEntity>> fetchPokemonUrl(IndexApiParams params);
  Future<PokemonEntity> fetchPokemonDetails(String pokemonUrl);
}
