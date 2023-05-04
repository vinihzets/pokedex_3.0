import 'package:flutter/widgets.dart';
import 'package:pokedex_3/core/architeture/event.dart';

abstract class FavoriteEvent extends Event {}

class FavoriteEventGetListFavorites implements FavoriteEvent {}

class FavoriteEventNavigateToDetails implements FavoriteEvent {
  BuildContext context;
  Object args;

  FavoriteEventNavigateToDetails(this.context, this.args);
}
