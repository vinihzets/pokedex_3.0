import 'dart:developer';

import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_firebase_mapper.dart';
import 'package:pokedex_3/core/global/mappers/pokemon_mapper.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/services/database/database_service.dart';
import 'package:pokedex_3/features/favorites/data/datasources/favorite_datasources.dart';

class FavoriteDataSourcesRemoteImpl implements FavoriteDataSources {
  DatabaseService databaseService;
  AuthService authService;

  FavoriteDataSourcesRemoteImpl(this.databaseService, this.authService);

  @override
  Future<List<PokemonEntity>> getFavorites() async {
    final getCollection =
        await databaseService.database.collection('favorites').get();

    final listPokemonsFavorites = getCollection.docs
        .map((e) => PokemonFavoriteFirebaseMapper.fromMap(e.data()))
        .where((element) => element.userId == authService.auth.currentUser!.uid)
        .toList();

    return listPokemonsFavorites;
  }
}
