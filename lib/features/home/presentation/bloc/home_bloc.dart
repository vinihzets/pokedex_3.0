import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/favorites/domain/usecases/get_list_favorites_usecase_impl.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_type_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/domain/usecases/get_list_favorites_usecase_imp.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';

import '../../../../core/architeture/usecase.dart';
import '../../domain/usecases/sign_out_usecase_impl.dart';

class HomeBloc extends Bloc {
  FetchPokemonUrlUseCaseImpl fetchPokemonUrlUseCaseImpl;
  FetchPokemonUrlTypeUseCaseImpl fetchPokemonUrlTypeUseCaseImpl;
  SignOutUseCaseImpl signOutUseCaseImpl;
  GetFavoritesUseCaseImpl getListFavoritesUseCaseImpl;
  ConstsRoutes routes;
  int currentIndex = 0;
  int limit = 20;

  late List<UrlEntity> listUrls;
  late List<PokemonEntity> favorites;

  HomeBloc(
      this.fetchPokemonUrlUseCaseImpl,
      this.routes,
      this.fetchPokemonUrlTypeUseCaseImpl,
      this.signOutUseCaseImpl,
      this.getListFavoritesUseCaseImpl) {
    listUrls = [];
    favorites = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventFetchUrl) {
      _handleFetchPokemonUrl();
    } else if (event is HomeEventNavigateDetails) {
      navigateThenUntilArgs(event.context, routes.pokemonDetails, event.args);
    } else if (event is HomeEventFetchPokemonTypeUrl) {
      _handleFetchPokemonTypeUrl(event.context, event.url);
    } else if (event is HomeEventNavigatePop) {
      navigatePop(event.context);
    } else if (event is HomeEventSignOut) {
      _handleSignOut(event.context);
    } else if (event is HomeEventOpenDrawer) {
      _handleOpenDrawer(event.context);
    } else if (event is HomeEventGetListFavorites) {
      _handleGetListFavorites();
    }
  }

  _handleFetchPokemonUrl() async {
    final fetchRequest = await fetchPokemonUrlUseCaseImpl
        .call(IndexApiParams(currentIndex, limit));
    fetchRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      listUrls.addAll(r);

      currentIndex += 20;

      dispatchState(BlocStableState(data: listUrls));
    });
  }

  _handleFetchPokemonTypeUrl(BuildContext context, String typeUrl) async {
    dispatchState(BlocLoadingState());
    final fetchRequest =
        await fetchPokemonUrlTypeUseCaseImpl.call(TypeParams(typeUrl));

    fetchRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      if (r.isEmpty) {
        dispatchState(BlocEmptyState());
        navigatePop(context);
      } else {
        dispatchState(BlocStableState(data: r));
        navigatePop(context);
      }
    });
  }

  _handleSignOut(
    BuildContext context,
  ) async {
    final signOutRequest = await signOutUseCaseImpl.call(NoParams());

    signOutRequest.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      navigateRemoveUntil(context, routes.loginView);
    });
  }

  _handleOpenDrawer(BuildContext context) {
    return Scaffold.of(context).openDrawer();
  }

  _handleGetListFavorites() async {
    final getRequest = await getListFavoritesUseCaseImpl.call(NoParams());

    getRequest.fold((l) {}, (r) {
      favorites.addAll(r);
    });
  }
}
