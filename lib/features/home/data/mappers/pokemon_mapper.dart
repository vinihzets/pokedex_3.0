import 'package:pokedex_3/features/home/data/mappers/type_mapper.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';

class PokemonMapper extends PokemonEntity {
  PokemonMapper(
    super.name,
    super.id,
    super.weight,
    super.height,
    super.sprite,
    super.types,
  );

  factory PokemonMapper.fromMap(dynamic map) {
    return PokemonMapper(
      map['name'],
      map['id'],
      map['weight'],
      map['height'],
      map['sprites']['other']['official-artwork']['front_default'],
      (map['types'] as List).map((e) => TypeMapper.fromMap(e)).toList(),
    );
  }
}
