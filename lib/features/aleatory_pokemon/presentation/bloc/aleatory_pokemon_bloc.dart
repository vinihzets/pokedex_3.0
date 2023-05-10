import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/features/aleatory_pokemon/domain/usecases/caught_aleatory_pokemon_usecase_impl.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_event.dart';

import '../../domain/usecases/fetch_aleatory_pokemon_usecase_impl.dart';

class AleatoryPokemonBloc extends Bloc {
  FetchAleatoryPokemonUseCaseImpl fetchAleatoryPokemonUseCaseImpl;
  CaughtAleatoryPokemonUseCaseImpl caughtAleatoryPokemonUseCaseImpl;
  AleatoryPokemonBloc(this.fetchAleatoryPokemonUseCaseImpl,
      this.caughtAleatoryPokemonUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is AleatoryPokemonEventFetchAleatory) {
      _handleFetchAleatoryPokemon();
    } else if (event is AleatoryPokemonEventOpenDrawer) {
      _handleOpenDrawer(event.context);
    } else if (event is AleatoryPokemonEventTryCaught) {
      _handleTryCaughtPokemon(event.context, event.params);
    }
  }

  _handleFetchAleatoryPokemon() async {
    dispatchState(BlocLoadingState());
    final fetchRequest = await fetchAleatoryPokemonUseCaseImpl.call(NoParams());

    fetchRequest.fold((l) {}, (r) {
      dispatchState(BlocStableState(data: r));
    });
  }

  _handleTryCaughtPokemon(
      BuildContext context, PokemonCaughtParams params) async {
    var random = Random();

    final isCaught = random.nextBool();

    if (isCaught == true) {
      final request = await caughtAleatoryPokemonUseCaseImpl.call(params);
      request.fold((l) {
        dispatchState(BlocErrorState(error: l.message));
      }, (r) {
        return showSnack(context, 'Capturou com Sucesso', Colors.green);
      });
    } else {
      showSnack(context, 'Pokeball Falhou', Colors.red);
    }
  }

  _handleOpenDrawer(BuildContext context) {
    return Scaffold.of(context).openDrawer();
  }
}
