import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class FavoriteEmptyState extends StatelessWidget {
  final BlocState state;
  const FavoriteEmptyState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
