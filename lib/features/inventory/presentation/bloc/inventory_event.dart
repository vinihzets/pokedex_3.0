import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';

class InventoryEvent extends Event {}

class InventoryEventFetch implements InventoryEvent {}

class InventoryEventOpenDrawer implements InventoryEvent {
  BuildContext context;

  InventoryEventOpenDrawer(this.context);
}
