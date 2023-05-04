import 'dart:developer';

import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/favorites/domain/usecases/get_list_favorites_usecase_impl.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_event.dart';

class FavoriteBloc extends Bloc {
  GetListFavoritesUseCaseImpl getListFavoritesUseCaseImpl;
  ConstsRoutes routes;
  FavoriteBloc(this.getListFavoritesUseCaseImpl, this.routes);

  @override
  mapListenEvent(Event event) {
    if (event is FavoriteEventGetListFavorites) {
      _handleGetListFavorites();
    } else if (event is FavoriteEventNavigateToDetails) {
      navigateThenUntilArgs(event.context, routes.pokemonDetails, event.args);
    }
  }

  _handleGetListFavorites() async {
    dispatchState(BlocLoadingState());

    final getRequest = await getListFavoritesUseCaseImpl.call(NoParams());
    getRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      for (var element in r) {
        element.isFavorited = true;
      }

      dispatchState(BlocStableState(data: r));
    });
  }
}
