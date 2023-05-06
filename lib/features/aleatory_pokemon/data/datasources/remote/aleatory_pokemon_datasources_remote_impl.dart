import 'dart:convert';
import 'dart:math';

import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/features/aleatory_pokemon/data/datasources/aleatory_pokemon_datasources.dart';
import 'package:http/http.dart' as http;

class AleatoryPokemonDataSourcesRemoteImpl
    implements AleatoryPokemonDataSources {
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
}
