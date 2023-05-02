import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class HomeEmptyState extends StatelessWidget {
  final BlocState state;
  const HomeEmptyState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Nenhum pokemon com este elemento encontrado',
        style: TextStyle(fontWeight: FontWeight.w600),
      )),
    );
  }
}
