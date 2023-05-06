import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/features/aleatory_pokemon/domain/usecases/fetch_aleatory_pokemon.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_event.dart';

class AleatoryPokemonBloc extends Bloc {
  FetchAleatoryPokemonUseCaseImpl fetchAleatoryPokemonUseCaseImpl;

  AleatoryPokemonBloc(this.fetchAleatoryPokemonUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is AleatoryPokemonEventFetchAleatory) {
      _handleFetchAleatoryPokemon();
    } else if (event is AleatoryPokemonEventOpenDrawer) {}
  }

  _handleFetchAleatoryPokemon() async {
    dispatchState(BlocLoadingState());
    final fetchRequest = await fetchAleatoryPokemonUseCaseImpl.call(NoParams());

    fetchRequest.fold((l) {}, (r) {
      inspect(r);
      dispatchState(BlocStableState(data: r));
    });
  }

  handleTryCaughtPokemon() async {
    var random = Random();
    final isCaught = random.nextBool();
    isCaught == true ? print('capturo') : print('nop');
  }

  _handleOpenDrawer(BuildContext context) {
    return Scaffold.of(context).openDrawer();
  }
}
