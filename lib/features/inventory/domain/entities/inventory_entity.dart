import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/inventory/domain/entities/pokeball_entity.dart';

class InventoryEntity {
  List<PokeballEntity> pokeballs;

  List<PokemonEntity> pokemons;

  InventoryEntity(this.pokeballs, this.pokemons);
}
