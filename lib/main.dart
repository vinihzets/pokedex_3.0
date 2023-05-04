import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/inject/injector.dart';
import 'package:pokedex_3/core/services/firebase/firebase_initialize.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'core/utils/routes.dart';

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
