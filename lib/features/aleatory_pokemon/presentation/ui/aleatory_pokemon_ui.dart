import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/core/components/drawer/ui/custom_drawer.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_bloc.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_event.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_empty_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_error_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_loading_state.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/ui/aleatory_pokemon_stable_state.dart';

class AleatoryPokemonView extends StatefulWidget {
  const AleatoryPokemonView({super.key});

  @override
  State<AleatoryPokemonView> createState() => _AleatoryPokemonViewState();
}

class _AleatoryPokemonViewState extends State<AleatoryPokemonView> {
  late AleatoryPokemonBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(AleatoryPokemonEventFetchAleatory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.arrow_back)),
        ),
      ),
      drawer: const CustomDrawer(),
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => AleatoryPokemonStableState(
                state: onStable,
                bloc: bloc,
              ),
          onError: (onError) => AleatoryPokemonErrorState(state: onError),
          onLoading: (onLoading) =>
              AleatoryPokemonLoadingState(state: onLoading),
          onEmpty: (onEmpty) => AleatoryPokemonEmptyState(state: onEmpty)),
    );
  }
}
