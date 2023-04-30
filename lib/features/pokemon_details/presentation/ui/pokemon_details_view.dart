import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_event.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/ui/pokemon_details_empty_state.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/ui/pokemon_details_error_state.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/ui/pokemon_details_loading_state.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/ui/pokemon_details_stable_state.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({super.key});

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  late PokemonDetailsBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(PokemonDetailsOnReady(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => PokemonDetailsStableState(state: onStable),
          onError: (onError) => PokemonDetailsErrorState(state: onError),
          onLoading: (onLoading) =>
              PokemonDetailsLoadingState(state: onLoading),
          onEmpty: (onEmpty) => PokemonDetailsEmptyState(state: onEmpty)),
    );
  }
}
