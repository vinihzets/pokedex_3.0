import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';

class RegisterErrorState extends StatelessWidget {
  final BlocState state;

  const RegisterErrorState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
