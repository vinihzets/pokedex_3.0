import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_event.dart';

class PokemonDetailsBloc extends Bloc {
  @override
  mapListenEvent(Event event) {
    if (event is PokemonDetailsOnReady) {
      _handleGetPokemonDetails(event.context);
    } else if (event is PokemonDetailsNavigateToHome) {
      navigatePop(event.context);
    }
  }

  _handleGetPokemonDetails(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonEntity;

    dispatchState(BlocStableState(data: pokemon));
  }
}
