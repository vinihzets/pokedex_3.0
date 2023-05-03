import 'dart:developer';

import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/architeture/usecase.dart';
import 'package:pokedex_3/features/favorites/domain/usecases/get_list_favorites_usecase_impl.dart';
import 'package:pokedex_3/features/favorites/presentation/bloc/favorite_event.dart';

class FavoriteBloc extends Bloc {
  GetListFavoritesUseCaseImpl getListFavoritesUseCaseImpl;

  FavoriteBloc(this.getListFavoritesUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is FavoriteEventGetListFavorites) {
      _handleGetListFavorites();
    }
  }

  _handleGetListFavorites() async {
    final getRequest = await getListFavoritesUseCaseImpl.call(NoParams());
    getRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      inspect(r);
    });
  }
}
