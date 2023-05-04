import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';

class FavoriteStableState extends StatelessWidget {
  final BlocState state;
  const FavoriteStableState({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final List<PokemonEntity> listFavorites = state.data;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: listFavorites.length,
          itemBuilder: (context, index) {
            final pokemon = listFavorites[index];

            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: pokemon.types.first.element.getColor(),
                  backgroundImage: NetworkImage(pokemon.sprite),
                ),
                title: Text(
                  pokemon.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            );
          }),
    );
  }
}
