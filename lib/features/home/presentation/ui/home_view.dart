import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_empty_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_error_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_loading_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_stable_state.dart';
import 'package:pokedex_3/features/home/presentation/widgets/pokemon_search.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;
  late HomeDataSources dataSources;
  @override
  void initState() {
    bloc = GetIt.I.get();
    dataSources = GetIt.I.get();

    bloc.dispatchEvent(HomeEventFetchUrl());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      PokemonSearch(dataSources: dataSources, bloc: bloc));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
        title: const Text(
          'Dex 3.0',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => HomeStableState(
                state: onStable,
                bloc: bloc,
              ),
          onError: (onError) => HomeErrorState(state: onError),
          onLoading: (onLoading) => HomeLoadingState(state: onLoading),
          onEmpty: (onEmpty) => HomeEmptyState(state: onEmpty)),
    );
  }
}
