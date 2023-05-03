import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/pokemon_details/domain/usecases/add_favorites_usecase_impl.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_event.dart';

class PokemonDetailsBloc extends Bloc {
  AddFavoritesUseCaseImpl addFavoritesUseCaseImpl;
  ConstsRoutes routes;

  PokemonDetailsBloc(this.addFavoritesUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is PokemonDetailsOnReady) {
      _handleGetPokemonDetails(event.context);
    } else if (event is PokemonDetailsNavigateToHome) {
      navigatePop(event.context);
    } else if (event is PokemonDetailsAddFavorites) {
      _handleAddFavorites(event.context, event.pokemon);
    }
  }

  _handleGetPokemonDetails(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonEntity;

    dispatchState(BlocStableState(data: pokemon));
  }

  _handleAddFavorites(BuildContext context, PokemonEntity params) async {
    final addRequest = await addFavoritesUseCaseImpl.call(params);
    addRequest.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      showSnack(context, 'Pokemon Adicionado a lista de favoritos com sucesso',
          Colors.green);
      navigateRemoveUntil(context, routes.homeView);
    });
  }
}
