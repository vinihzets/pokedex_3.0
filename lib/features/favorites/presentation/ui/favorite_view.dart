import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_event.dart';
import 'package:pokedex_3/features/favorites/presentation/ui/favorite_empty_state.dart';
import 'package:pokedex_3/features/favorites/presentation/ui/favorite_error_state.dart';
import 'package:pokedex_3/features/favorites/presentation/ui/favorite_loading_state.dart';
import 'package:pokedex_3/features/favorites/presentation/ui/favorite_stable_state.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  late FavoriteBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(FavoriteEventGetListFavorites());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (onStable) => FavoriteStableState(
                state: onStable,
                bloc: bloc,
              ),
          onError: (onError) => FavoriteErrorState(state: onError),
          onLoading: (onLoading) => FavoriteLoadingState(state: onLoading),
          onEmpty: (onEmpty) => FavoriteEmptyState(state: onEmpty)),
    );
  }
}
