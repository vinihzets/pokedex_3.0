import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/home/data/mappers/url_mapper.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_type_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/domain/usecases/fetch_pokemon_url_usecase_imp.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';

import '../../domain/usecases/sign_out_usecase_impl.dart';

class HomeBloc extends Bloc {
  FetchPokemonUrlUseCaseImpl fetchPokemonUrlUseCaseImpl;
  FetchPokemonUrlTypeUseCaseImpl fetchPokemonUrlTypeUseCaseImpl;
  SignOutUseCaseImpl signOutUseCaseImpl;
  ConstsRoutes routes;
  int currentIndex = 0;
  int limit = 20;

  late List<UrlEntity> listUrls;

  HomeBloc(this.fetchPokemonUrlUseCaseImpl, this.routes,
      this.fetchPokemonUrlTypeUseCaseImpl, this.signOutUseCaseImpl) {
    listUrls = [];
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
      dispatchState(BlocStableState(data: r));
      navigatePop(context);
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
}
