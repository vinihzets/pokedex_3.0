import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';

class SplashEvent implements Event {}

class SplashEventAuthentication implements SplashEvent {
  BuildContext context;

  SplashEventAuthentication(this.context);
}
