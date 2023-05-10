import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_firebase_mapper.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/features/home/data/mappers/url_mapper.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/architeture/usecase.dart';

class HomeDataSourcesRemoteImpl implements HomeDataSources {
  AuthService auth;
  DatabaseService databaseService;

  HomeDataSourcesRemoteImpl(this.auth, this.databaseService);

  @override
  Future<List<UrlEntity>> fetchPokemonUrl(IndexApiParams params) async {
    final url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=${params.currentIndex}&limit=${params.limit}');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException('Erro na requisicao');
    }

    final decode = jsonDecode(response.body);

    final list = List<Map<String, dynamic>>.from(decode['results']);

    final listUrls = list.map(UrlMapper.fromMap).toList();

    return listUrls;
  }

  @override
  Future<PokemonEntity> fetchPokemonDetails(String pokemonUrl) async {
    final url = Uri.parse(pokemonUrl);

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException('Erro na requisicao de details');
    }

    final decode = jsonDecode(response.body);

    final pokemon = PokemonMapper.fromMap(decode);

    return pokemon;
  }

  @override
  Future<PokemonEntity> fetchPokemonBySearch(String pokemonName) async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName');

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException('erro na requisicao');
    }
    final decode = jsonDecode(response.body);

    final toObject = PokemonMapper.fromMap(decode);

    return toObject;
  }

  @override
  Future<List<UrlEntity>> fetchTypeUrl() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/type');

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException('erro na requisicao');
    }
    final decode = jsonDecode(response.body);

    final list = decode['results'] as List;

    final listUrl = list.map((e) => UrlMapper.fromMap(e)).toList();

    return listUrl;
  }

  @override
  Future<List<UrlEntity>> fetchPokemonsUrlByType(String typePokemonUrl) async {
    var url = Uri.parse(typePokemonUrl);

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw const HttpException('erro na requisicao');
    }

    final decode = jsonDecode(response.body);

    final listPokemons = decode['pokemon'] as List;

    final parserToObject =
        listPokemons.map((e) => UrlMapper.fromMap(e)).toList();

    return parserToObject;
  }

  @override
  Future<void> signOut() async {
    try {
      final signOutRequest = await auth.auth.signOut();

      return signOutRequest;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<List<PokemonEntity>> getFavorites() async {
    final docsGet =
        await databaseService.database.collection('favorites').get();

    final listFavorites = docsGet.docs
        .map((e) => PokemonFavoriteFirebaseMapper.fromMap(e.data()))
        .where((element) => element.userId == auth.auth.currentUser!.uid)
        .toList();

    return listFavorites;
  }
}
