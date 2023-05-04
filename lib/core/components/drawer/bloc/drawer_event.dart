import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';

class DrawerEvent extends Event {}

class DrawerEventNavigate implements DrawerEvent {
  BuildContext context;
  String routeName;

  DrawerEventNavigate(this.context, this.routeName);
}
