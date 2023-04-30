import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/utils/first_string_uppercase.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/bloc/pokemon_details_event.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonDetailsStableState extends StatelessWidget {
  final BlocState state;
  final PokemonDetailsBloc bloc;
  const PokemonDetailsStableState(
      {required this.state, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = state.data as PokemonEntity;

    return SlidingUpPanel(
      maxHeight: 210,
      panelBuilder: (sc) => _buildBodySlidingPanel(context, pokemon),
      body: _buildBodyScaffold(context, pokemon),
    );
  }

  _buildBodySlidingPanel(BuildContext context, PokemonEntity pokemon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            pokemon.name.toUpperCaseFirstString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: pokemon.types
                .map((e) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      decoration: BoxDecoration(
                          color: e.element.getColor(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        e.element.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(pokemon.weight.toString()),
              Text(pokemon.height.toString())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [Text('Weight'), Text('Height')],
          ),
        ],
      ),
    );
  }

  _buildBodyScaffold(BuildContext context, PokemonEntity pokemon) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () =>
                      bloc.dispatchEvent(PokemonDetailsNavigateToHome(context)),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const Text(
                'Detalhes',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                '#0${pokemon.id}',
                style: const TextStyle(color: Colors.white, fontSize: 26),
              )
            ],
          ),
          Image.network(pokemon.sprite)
        ],
      ),
    );
  }
}
