import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_bloc.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_empty_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_error_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_loading_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_stable_state.dart';

class AleatoryPokemon extends StatefulWidget {
  const AleatoryPokemon({super.key});

  @override
  State<AleatoryPokemon> createState() => _AleatoryPokemonState();
}

class _AleatoryPokemonState extends State<AleatoryPokemon> {
  late AleatoryPokemonBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => AleatoryPokemonStableState(state: onStable),
          onError: (onError) => AleatoryPokemonErrorState(state: onError),
          onLoading: (onLoading) =>
              AleatoryPokemonLoadingState(state: onLoading),
          onEmpty: (onEmpty) => AleatoryPokemonEmptyState(state: onEmpty)),
    );
  }
}
