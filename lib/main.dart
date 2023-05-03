import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/inject/injector.dart';
import 'package:pokedex_3/core/services/firebase/firebase_initialize.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_view.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_view.dart';
import 'package:pokedex_3/features/pokemon_details/presentation/ui/pokemon_details_view.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_view.dart';
import 'package:pokedex_3/features/splash/presentation/ui/splash_view.dart';

void main() async {
  Injector.inject();

  await FirebaseInit.initalize();

  late ConstsRoutes route;

  route = GetIt.I.get();

  runApp(MaterialApp(
    routes: Routes.build(route),
    initialRoute: route.splashView,
  ));
}

class Routes {
  static build(ConstsRoutes route) {
    final routes = <String, Widget Function(BuildContext)>{
      route.splashView: (_) => const SplashView(),
      route.loginView: (_) => const LoginView(),
      route.registerView: (_) => const RegisterView(),
      route.homeView: (_) => const HomeView(),
      route.pokemonDetails: (_) => const PokemonDetailsView(),
    };
    return routes;
  }
}
