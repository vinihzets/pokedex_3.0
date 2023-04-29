import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';

class LoginEvent implements Event {}

class LoginEventOnReady implements Event {}

class LoginEventNavigate implements Event {
  BuildContext context;

  LoginEventNavigate(this.context);
}

class LoginEventSignIn implements Event {
  BuildContext context;
  UserParams params;

  LoginEventSignIn(this.context, this.params);
}
