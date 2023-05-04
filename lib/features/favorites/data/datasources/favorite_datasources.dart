import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class FavoriteDataSources {
  Future<List<PokemonEntity>> getFavorites();
}
