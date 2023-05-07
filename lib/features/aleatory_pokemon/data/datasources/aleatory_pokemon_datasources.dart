import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

abstract class AleatoryPokemonDataSources {
  Future<PokemonEntity> fetchAleatory();
  Future<dynamic> caught(PokemonEntity pokemon);
}
