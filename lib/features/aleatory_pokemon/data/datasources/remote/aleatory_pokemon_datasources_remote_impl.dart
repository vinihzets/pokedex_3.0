import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/aleatory_pokemon/data/mappers/aleatory_pokemon_mapper.dart';
import 'package:pokedex_3/features/inventory/data/mappers/inventory_mapper.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/aleatory_pokemon/data/datasources/aleatory_pokemon_datasources.dart';
import 'package:http/http.dart' as http;

class AleatoryPokemonDataSourcesRemoteImpl
    implements AleatoryPokemonDataSources {
  final DatabaseService _databaseService;
  final AuthService _authService;

  AleatoryPokemonDataSourcesRemoteImpl(
      this._databaseService, this._authService);

  @override
  Future<PokemonEntity> fetchAleatory() async {
    var random = Random();

    final id = random.nextInt(900);

    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      final pokemon = PokemonMapper.fromMap(decode);

      return pokemon;
    }

    throw Exception();
  }

  @override
  Future caughtPokemon(PokemonEntity pokemon) async {
    final collectionReference =
        _databaseService.database.collection('inventory');

    final getCollection = await collectionReference.get();

    final getDocs = getCollection.docs
        .map((e) => InventoryMapper.fromMap(e.data()))
        .where(
            (element) => element.userId == _authService.auth.currentUser!.uid)
        .toList();

    final inventory = getDocs.first;
    final pokeballs = inventory.pokeballs;

    if (getDocs.isNotEmpty) {
      final listPokemons = [...inventory.pokemons, pokemon];
      inspect(listPokemons);
      pokeballs.first.quantity--;

      await collectionReference.doc(inventory.docId).update({
        'pokemons': listPokemons
            .map((e) => AleatoryPokemonMapper.toMapPokemon(e))
            .toList(),
        'pokeballs': pokeballs
            .map((e) => AleatoryPokemonMapper.toMapPokeball(e))
            .toList()
      });
    } else {
      collectionReference.doc(inventory.docId).update({
        'pokemons': [pokemon],
      });
    }
  }
}
