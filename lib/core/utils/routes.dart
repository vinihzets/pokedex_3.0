import 'package:flutter/material.dart';
import 'package:pokedex_3/features/inventory/presentation/ui/inventory_view.dart';

import '../../features/favorites/presentation/ui/favorite_view.dart';
import '../../features/home/presentation/ui/home_view.dart';
import '../../features/login/presentation/ui/login_view.dart';
import '../../features/pokemon_details/presentation/ui/pokemon_details_view.dart';
import '../../features/register/presentation/ui/register_view.dart';
import '../../features/splash/presentation/ui/splash_view.dart';
import 'consts.dart';

class Routes {
  static build(ConstsRoutes route) {
    final routes = <String, Widget Function(BuildContext)>{
      route.splashView: (_) => const SplashView(),
      route.loginView: (_) => const LoginView(),
      route.registerView: (_) => const RegisterView(),
      route.homeView: (_) => const HomeView(),
      route.pokemonDetails: (_) => const PokemonDetailsView(),
      route.favoriteView: (_) => const FavoriteView(),
      route.inventoryView: (_) => const InventoryView(),
    };
    return routes;
  }
}
