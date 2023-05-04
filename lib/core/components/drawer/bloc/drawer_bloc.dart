import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/components/drawer/bloc/drawer_event.dart';

class DrawerBloc extends Bloc {
  @override
  mapListenEvent(Event event) {
    if (event is DrawerEventNavigate) {
      _handleNavigateToFeature(event.context, event.routeName);
    }
  }

  _handleNavigateToFeature(BuildContext context, String routeName) {
    navigateThenUntil(context, routeName);
  }
}
