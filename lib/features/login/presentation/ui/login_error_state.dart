import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class LoginErrorState extends StatelessWidget {
  final BlocState state;
  const LoginErrorState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(state.data.toString()),
      ),
    );
  }
}
