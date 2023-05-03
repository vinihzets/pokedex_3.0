import 'package:pokedex_3/core/architeture/event.dart';

abstract class FavoriteEvent extends Event {}

class FavoriteEventGetListFavorites implements FavoriteEvent {}
