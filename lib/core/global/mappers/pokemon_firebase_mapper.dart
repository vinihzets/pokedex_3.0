import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/type_mapper.dart';

class PokemonFavoriteFirebaseMapper extends PokemonEntity {
  String documentId;
  String userId;

  PokemonFavoriteFirebaseMapper(
      this.documentId,
      this.userId,
      super.name,
      super.id,
      super.weight,
      super.height,
      super.sprite,
      super.types,
      super.isFavorited);

  factory PokemonFavoriteFirebaseMapper.fromMap(Map map) {
    return PokemonFavoriteFirebaseMapper(
      map['docId'] ?? '',
      map['userId'] ?? '',
      map['name'] ?? '',
      map['id'] ?? 0,
      map['weight'] ?? 0,
      map['height'] ?? 0,
      map['sprites']['other']['official-artwork']['front_default'] ?? '',
      (map['types'] as List).map((e) => TypeMapper.fromMap(e)).toList(),
      map['isFavorited'] ?? false,
    );
  }
}
