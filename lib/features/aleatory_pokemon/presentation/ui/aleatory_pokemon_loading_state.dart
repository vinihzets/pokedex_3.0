import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class AleatoryPokemonLoadingState extends StatelessWidget {
  final BlocState state;
  const AleatoryPokemonLoadingState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
