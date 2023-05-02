import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class PokemonDetailsLoadingState extends StatelessWidget {
  final BlocState state;
  const PokemonDetailsLoadingState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
