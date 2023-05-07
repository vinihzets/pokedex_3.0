import 'package:flutter/cupertino.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';

class AleatoryPokemonEvent extends Event {}

class AleatoryPokemonEventFetchAleatory implements AleatoryPokemonEvent {}

class AleatoryPokemonEventOpenDrawer implements AleatoryPokemonEvent {
  BuildContext context;

  AleatoryPokemonEventOpenDrawer(this.context);
}

class AleatoryPokemonEventTryCaught implements AleatoryPokemonEvent {
  BuildContext context;
  PokemonCaughtParams params;

  AleatoryPokemonEventTryCaught(this.context, this.params);
}
