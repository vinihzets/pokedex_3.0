import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/inject/injector.dart';
import 'package:pokedex_3/core/services/firebase/firebase_initialize.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/features/home/presentation/ui/home_view.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_view.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_view.dart';
import 'package:pokedex_3/features/splash/presentation/ui/splash_view.dart';

void main() async {
  Injector.inject();

  await FirebaseInit.initalize();

  late ConstsRoutes routes;

  routes = GetIt.I.get();

  runApp(MaterialApp(
    routes: {
      routes.splashView: (_) => const SplashView(),
      routes.loginView: (_) => const LoginView(),
      routes.registerView: (_) => const RegisterView(),
      routes.homeView: (_) => const HomeView(),
    },
    initialRoute: routes.splashView,
  ));
}
