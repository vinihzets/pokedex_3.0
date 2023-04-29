import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/services/auth/auth_service.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/splash/presentation/bloc/splash_event.dart';

class SplashBloc extends Bloc {
  ConstsRoutes routes;
  AuthService auth;

  SplashBloc(this.routes, this.auth) {}

  @override
  mapListenEvent(Event event) {
    if (event is SplashEventAuthentication) {
      _handleAuthentication(event.context);
    }
  }

  _handleAuthentication(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (auth.auth.currentUser != null) {
        return navigateRemoveUntil(context, routes.homeView);
      } else if (auth.auth.currentUser == null) {
        return navigateRemoveUntil(context, routes.loginView);
      }
    });
  }
}
