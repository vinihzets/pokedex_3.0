import 'package:pokedex_3/core/global/mappers/pokeball_mapper.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

class InventoryMapper extends InventoryEntity {
  InventoryMapper(super.pokeballs, super.pokemons, super.userId);

  factory InventoryMapper.fromMap(dynamic map) {
    return InventoryMapper(
      (map['pokeballs'] as List).map((e) => PokeballMapper.fromMap(e)).toList(),
      map['pokemons'] ?? [],
      map['userId'] ?? '',
    );
  }
}
