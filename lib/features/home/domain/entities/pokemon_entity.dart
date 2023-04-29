import 'package:pokedex_3/features/home/domain/entities/type_entity.dart';

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
