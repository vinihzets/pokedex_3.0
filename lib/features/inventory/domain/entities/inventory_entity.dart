import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/entities/pokeball_entity.dart';

class InventoryEntity {
  String userId;

  List<PokemonEntity> pokemons;
  List<PokeballEntity> pokeballs;
  String docId;

  InventoryEntity(this.pokeballs, this.pokemons, this.userId, this.docId);
}
