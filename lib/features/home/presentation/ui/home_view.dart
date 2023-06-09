import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/home/data/datasources/home_datasources.dart';
import 'package:pokedex_3/core/global/entities/type_entity.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_empty_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_error_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_loading_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_stable_state.dart';
import 'package:pokedex_3/features/home/presentation/widgets/pokemon_search.dart';

import '../../../../core/components/drawer/ui/custom_drawer.dart';

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
    bloc.dispatchEvent(HomeEventGetListFavorites());
    bloc.dispatchEvent(HomeEventFetchUrl());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: _buildAppBar(),
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

  _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
            onPressed: () => bloc.dispatchEvent(HomeEventOpenDrawer(context)),
            icon: const Icon(
              Icons.format_list_bulleted,
              color: Colors.black,
            )),
      ),
      title: const Text(
        'PokeDex',
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
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                  'Voce realmente deseja fazer log-out do aplicativo?'),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () => bloc.dispatchEvent(
                                          HomeEventNavigatePop(context)),
                                      child: const Text('Inicio')),
                                  TextButton(
                                      onPressed: () => bloc.dispatchEvent(
                                          HomeEventSignOut(context)),
                                      child: const Text(
                                        'Sair',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
            },
            icon: const Icon(
              Icons.highlight_remove_sharp,
              color: Colors.black,
            ))
      ],
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
