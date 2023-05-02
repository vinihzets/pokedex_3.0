import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/features/home/domain/entities/type_entity.dart';
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
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.library_books,
                color: Colors.black,
              )),
        ),
        title: const Text(
          'Dex 3.0',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => _buildModalBottomSheet(),
              icon: const Icon(
                Icons.library_books,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () => _buildSearch(),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          TextButton(
              onPressed: () => bloc.dispatchEvent(HomeEventSignOut(context)),
              child: Text('deslogar'))
        ],
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

  _buildSearch() {
    return showSearch(
        context: context,
        delegate: PokemonSearch(dataSources: dataSources, bloc: bloc));
  }

  _buildModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => FutureBuilder(
            future: dataSources.fetchTypeUrl(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final listTypes = snapshot.data!;
                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: listTypes.map((e) {
                    final TypeEnum type = TypeEnum.createFromName(e.name);

                    return GestureDetector(
                      onTap: () => bloc.dispatchEvent(
                          HomeEventFetchPokemonTypeUrl(e.url, context)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: type.getColor(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            e.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList()
                    ..add(GestureDetector(
                      onTap: () {
                        bloc.dispatchEvent(HomeEventFetchUrl());
                        bloc.dispatchEvent(HomeEventNavigatePop(context));
                      },
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: const Text(
                            'Todos Elementos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )),
                );
              } else {
                return Container();
              }
            }));
  }
}
