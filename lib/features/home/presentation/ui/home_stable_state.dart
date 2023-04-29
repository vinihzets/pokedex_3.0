import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_3/features/home/domain/entities/url_entity.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_3/features/home/presentation/widgets/build_pokemon_container_card.dart';

class HomeStableState extends StatefulWidget {
  final BlocState state;
  final HomeBloc bloc;
  const HomeStableState({required this.state, required this.bloc, super.key});

  @override
  State<HomeStableState> createState() => _HomeStableStateState();
}

class _HomeStableStateState extends State<HomeStableState> {
  late HomeDataSources dataSources;
  late ScrollController controller;

  @override
  void initState() {
    dataSources = GetIt.I.get();
    controller = ScrollController();

    controller.addListener(infiniteScrolling);

    super.initState();
  }

  infiniteScrolling() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      widget.bloc.dispatchEvent(HomeEventFetchUrl());
    }
  }

  @override
  Widget build(BuildContext context) {
    final listUrls = widget.state.data as List<UrlEntity>;

    return GridView.builder(
        controller: controller,
        itemCount: listUrls.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final pokemonDetail = listUrls[index];

          return FutureBuilder(
              future: dataSources.fetchPokemonDetails(pokemonDetail.url),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final pokemon = snapshot.data!;
                  return _buildStateData(pokemon);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return _buildStateWaiting();
                } else {
                  return _buildStateIdle();
                }
              });
        });
  }

  _buildStateWaiting() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildStateData(PokemonEntity pokemon) {
    return BuildPokemonContainerCard(pokemon: pokemon);
  }

  _buildStateIdle() {
    return const SizedBox.shrink();
  }
}
