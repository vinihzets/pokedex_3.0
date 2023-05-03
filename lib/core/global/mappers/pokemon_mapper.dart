import 'package:pokedex_3/core/global/mappers/type_mapper.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

class PokemonMapper extends PokemonEntity {
  PokemonMapper(super.name, super.id, super.weight, super.height, super.sprite,
      super.types, super.isFavorited);

  factory PokemonMapper.fromMap(dynamic map) {
    return PokemonMapper(
      map['name'],
      map['id'],
      map['weight'],
      map['height'],
      map['sprites']['other']['official-artwork']['front_default'],
      (map['types'] as List).map((e) => TypeMapper.fromMap(e)).toList(),
      map['isFavorited'] ?? false,
    );
  }

  toMap() {
    return {
      'name': name,
      'id': id,
      'weight': weight,
      'height': height,
      'sprites': {
        'other': {
          'official-artwork': {'front_default': sprite}
        }
      },
      'types': types.map((e) {
        final map = {
          'type': {'name': e.element.name}
        };
        return map;
      })
    };
  }
}
