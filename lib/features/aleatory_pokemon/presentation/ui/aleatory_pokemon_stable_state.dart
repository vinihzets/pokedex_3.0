import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/aleatory_pokemon/presentation/bloc/aleatory_pokemon_bloc.dart';
import 'package:pokedex_3/features/home/presentation/widgets/build_pokemon_container_card.dart';

import '../bloc/aleatory_pokemon_event.dart';

class AleatoryPokemonStableState extends StatelessWidget {
  final BlocState state;
  final AleatoryPokemonBloc bloc;
  const AleatoryPokemonStableState(
      {required this.state, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonEntity pokemon = state.data;

    return Scaffold(
      body: Container(
        color: pokemon.types.first.element.getColor(),
        child: Column(
          children: [
            TextButton(
                onPressed: () => bloc.dispatchEvent(
                    AleatoryPokemonEventTryCaught(
                        context, PokemonCaughtParams(pokemon))),
                child: const Text(
                  'Try Caught',
                  style:
                      TextStyle(color: Colors.deepOrangeAccent, fontSize: 24),
                )),
            Image.network(pokemon.sprite),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: pokemon.types
                  .map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                            color: e.element.getColor(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Text(e.element.name),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
