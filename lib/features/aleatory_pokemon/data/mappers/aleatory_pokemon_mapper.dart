import 'package:pokedex_3/core/global/entities/pokeball_entity.dart';

import '../../../../core/global/entities/pokemon_entity.dart';

class AleatoryPokemonMapper {
  static toMapPokemon(PokemonEntity pokemon) {
    return {
      'name': pokemon.name,
      'id': pokemon.id,
      'weight': pokemon.weight,
      'height': pokemon.height,
      'sprites': {
        'other': {
          'official-artwork': {'front_default': pokemon.sprite}
        }
      },
      'types': pokemon.types.map((e) {
        final map = {
          'type': {'name': e.element.name}
        };
        return map;
      })
    };
  }

  static toMapPokeball(PokeballEntity pokeball) {
    return {
      'ball': pokeball.ball,
      'quantity': pokeball.quantity,
      'rate': pokeball.rate,
    };
  }
}
