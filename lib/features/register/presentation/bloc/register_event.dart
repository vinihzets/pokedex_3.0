import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';

class RegisterEvent implements Event {}

class RegisterEventOnReady implements Event {}

class RegisterEventNavigate implements Event {
  BuildContext context;

  RegisterEventNavigate(this.context);
}

class RegisterEventSignUp implements Event {
  BuildContext context;
  RegisterParams params;

  RegisterEventSignUp(this.context, this.params);
}
