import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

class PokemonDetailsEvent extends Event {}

class PokemonDetailsOnReady implements PokemonDetailsEvent {
  BuildContext context;

  PokemonDetailsOnReady(this.context);
}

class PokemonDetailsNavigateToHome implements PokemonDetailsEvent {
  BuildContext context;

  PokemonDetailsNavigateToHome(this.context);
}

class PokemonDetailsAddFavorites implements PokemonDetailsEvent {
  PokemonEntity pokemon;
  BuildContext context;

  PokemonDetailsAddFavorites(this.pokemon, this.context);
}
