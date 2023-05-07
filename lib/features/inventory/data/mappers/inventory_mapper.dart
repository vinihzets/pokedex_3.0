import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/pokeball_mapper.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/features/inventory/domain/entities/inventory_entity.dart';

class InventoryMapper extends InventoryEntity {
  InventoryMapper(super.pokeballs, super.pokemons, super.userId, super.docId);

  factory InventoryMapper.fromMap(dynamic map) {
    return InventoryMapper(
        (map['pokeballs'] as List)
            .map((e) => PokeballMapper.fromMap(e))
            .toList(),
        (map['pokemons'] as List).map((e) => PokemonMapper.fromMap(e)).toList(),
        map['userId'] ?? '',
        map['docId'] ?? '');
  }
}
