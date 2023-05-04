import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_event.dart';

class FavoriteStableState extends StatelessWidget {
  final BlocState state;
  final FavoriteBloc bloc;
  const FavoriteStableState(
      {required this.state, required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Favoritos',
        ),
        centerTitle: true,
      ),
      body: _buildListView(),
    );
  }

  _buildListView() {
    final List<PokemonEntity> listFavorites = state.data;

    return ListView.builder(
        itemCount: listFavorites.length,
        itemBuilder: (context, index) {
          final pokemon = listFavorites[index];

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: ListTile(
              onTap: () => bloc.dispatchEvent(
                  FavoriteEventNavigateToDetails(context, pokemon)),
              leading: CircleAvatar(
                backgroundColor: pokemon.types.first.element.getColor(),
                backgroundImage: NetworkImage(pokemon.sprite),
              ),
              title: Text(
                pokemon.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
  }
}
