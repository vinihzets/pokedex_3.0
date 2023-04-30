import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';

class HomeEvent extends Event {}

class HomeEventFetchUrl implements HomeEvent {}

class HomeEventNavigateDetails implements HomeEvent {
  BuildContext context;
  Object args;

  HomeEventNavigateDetails(this.context, this.args);
}
