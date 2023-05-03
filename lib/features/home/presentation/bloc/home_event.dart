import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';

class HomeEvent extends Event {}

class HomeEventFetchUrl implements HomeEvent {}

class HomeEventNavigateDetails implements HomeEvent {
  BuildContext context;
  Object args;

  HomeEventNavigateDetails(this.context, this.args);
}

class HomeEventFetchPokemonTypeUrl implements HomeEvent {
  String url;
  BuildContext context;

  HomeEventFetchPokemonTypeUrl(this.url, this.context);
}

class HomeEventNavigatePop implements HomeEvent {
  BuildContext context;

  HomeEventNavigatePop(this.context);
}

class HomeEventSignOut implements HomeEvent {
  BuildContext context;

  HomeEventSignOut(this.context);
}

class HomeEventOpenDrawer implements HomeEvent {
  BuildContext context;

  HomeEventOpenDrawer(this.context);
}

class HomeEventGetListFavorites implements HomeEvent {}
