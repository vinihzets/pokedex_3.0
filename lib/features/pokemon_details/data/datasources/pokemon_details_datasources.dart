import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_firebase_mapper.dart';

abstract class PokemonDetailsDataSources {
  Future<void> addFavorites(PokemonEntity pokemon);
}
