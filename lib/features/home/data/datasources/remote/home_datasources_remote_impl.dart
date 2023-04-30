import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/data/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/features/home/data/mappers/url_mapper.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';
import 'package:http/http.dart' as http;

class HomeDataSourcesRemoteImpl implements HomeDataSources {
  @override
  Future<List<UrlEntity>> fetchPokemonUrl(IndexApiParams params) async {
    var url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=${params.currentIndex}&limit=${params.limit}');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      final list = decode['results'] as List;

      final listUrls = list.map(UrlMapper.fromMap).toList();

      return listUrls;
    } else {
      throw const HttpException('Erro na requisicao');
    }
  }

  @override
  Future<PokemonEntity> fetchPokemonDetails(String pokemonUrl) async {
    var url = Uri.parse(pokemonUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      final parseToObject = PokemonMapper.fromMap(decode);

      return parseToObject;
    } else {
      throw const HttpException('Erro na requisicao de details');
    }
  }

  @override
  Future<PokemonEntity> fetchPokemonBySearch(String pokemonName) async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      final toObject = PokemonMapper.fromMap(decode);

      return toObject;
    } else {
      throw Exception();
    }
  }
}
