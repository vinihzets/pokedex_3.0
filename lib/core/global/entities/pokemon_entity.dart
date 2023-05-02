import 'package:pokedex_3/core/global/entities/type_entity.dart';

class PokemonEntity {
  String name;
  int id;
  int weight;
  int height;
  String sprite;
  List<TypeEntity> types;

  PokemonEntity(
    this.name,
    this.id,
    this.weight,
    this.height,
    this.sprite,
    this.types,
  );
}
