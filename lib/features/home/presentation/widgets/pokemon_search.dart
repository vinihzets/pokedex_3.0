import 'package:flutter/material.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/core/global/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/core/utils/build_pokemon_container_card.dart';

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

            return _buildData(pokemon);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else {
            return _buildError();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }

  _buildData(PokemonEntity pokemon) {
    return Scaffold(
      backgroundColor: pokemon.types.first.element.getColor(),
      body: SingleChildScrollView(
        child: Center(
            child: BuildPokemonContainerCard(
          pokemon: pokemon,
          bloc: bloc,
          isSearch: true,
        )),
      ),
    );
  }

  _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildError() {
    return Center(
      child: Text('O pokemon $query nao foi encontrado'),
    );
  }
}
