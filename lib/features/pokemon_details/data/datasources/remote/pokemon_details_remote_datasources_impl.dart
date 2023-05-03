import 'dart:developer';

import 'package:pokedex_3/core/failure/failure.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_firebase_mapper.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/pokemon_details/data/datasources/pokemon_details_datasources.dart';

class PokemonDetailsRemoteDataSourcesRemoteImpl
    implements PokemonDetailsDataSources {
  DatabaseService databaseService;
  AuthService auth;

  PokemonDetailsRemoteDataSourcesRemoteImpl(this.databaseService, this.auth);

  @override
  Future<void> addFavorites(PokemonEntity pokemon) async {
    final dbFavorites = databaseService.database.collection('favorites');

    final mapper = pokemon as PokemonMapper;

    final favoritesGet = await dbFavorites.get();

    final listFavorites = favoritesGet.docs
        .map((e) => UserPokemonFirebaseMapper.fromMap(e.data()))
        .toList();

    final listFilter = listFavorites
        .where((element) =>
            element.userId == auth.auth.currentUser!.uid &&
            element.id == pokemon.id)
        .toList();

    if (listFilter.isEmpty) {
      dbFavorites.add(mapper.toMap()).then((value) => dbFavorites
          .doc(value.id)
          .update({'docId': value.id, 'userId': auth.auth.currentUser!.uid}));
    } else if (listFilter.isNotEmpty) {
      for (var e in listFilter) {
        dbFavorites.doc(e.documentId).delete();
      }
    }
  }
}
