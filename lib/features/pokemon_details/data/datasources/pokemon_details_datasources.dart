import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class PokemonDetailsDataSources {
  Future<void> addFavorites(PokemonEntity pokemon);
}
