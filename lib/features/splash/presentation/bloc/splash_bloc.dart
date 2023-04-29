import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/splash/presentation/bloc/splash_event.dart';

class SplashBloc extends Bloc {
  ConstsRoutes routes;

  SplashBloc(this.routes) {}

  @override
  mapListenEvent(Event event) {
    if (event is SplashEventAuthentication) {
      _handleAuthentication(event.context);
    }
  }

  _handleAuthentication(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => navigateRemoveUntil(context, routes.loginView));
  }
}
