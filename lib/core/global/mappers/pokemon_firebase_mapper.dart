import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/type_mapper.dart';

class UserPokemonFirebaseMapper extends PokemonEntity {
  String documentId;
  String userId;

  UserPokemonFirebaseMapper(this.documentId, this.userId, super.name, super.id,
      super.weight, super.height, super.sprite, super.types, super.isFavorited);

  factory UserPokemonFirebaseMapper.fromMap(Map map) {
    return UserPokemonFirebaseMapper(
      map['docId'],
      map['userId'],
      map['name'],
      map['id'],
      map['weight'],
      map['height'],
      map['sprites']['other']['official-artwork']['front_default'],
      (map['types'] as List).map((e) => TypeMapper.fromMap(e)).toList(),
      map['isFavorited'] ?? false,
    );
  }
}
