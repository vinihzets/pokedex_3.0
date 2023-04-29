import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_3/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_empty_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_error_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_loading_state.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_stable_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;
  late ScrollController controller;
  @override
  void initState() {
    bloc = GetIt.I.get();
    controller = ScrollController();

    bloc.dispatchEvent(HomeEventFetchUrl());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => HomeStableState(
                state: onStable,
                controller: controller,
                bloc: bloc,
              ),
          onError: (onError) => HomeErrorState(state: onError),
          onLoading: (onLoading) => HomeLoadingState(state: onLoading),
          onEmpty: (onEmpty) => HomeEmptyState(state: onEmpty)),
    );
  }
}
