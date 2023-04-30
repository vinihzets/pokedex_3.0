import 'package:flutter/material.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/widgets/build_pokemon_container_card.dart';

class PokemonSearch extends SearchDelegate<String> {
  final HomeDataSources dataSources;
  final HomeBloc bloc;
  PokemonSearch({required this.dataSources, required this.bloc});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: dataSources.fetchPokemonBySearch(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pokemon = snapshot.data!;

            return Scaffold(
              backgroundColor: pokemon.types.first.element.getColor(),
              body: Center(
                  child: BuildPokemonContainerCard(
                pokemon: pokemon,
                bloc: bloc,
                isSearch: true,
              )),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('O pokemon $query nao foi encontrado'),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }

  _buildData() {}

  _buildLoading() {}

  _buildError() {}
}
