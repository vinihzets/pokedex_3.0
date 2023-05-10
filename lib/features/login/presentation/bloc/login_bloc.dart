import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/core/utils/consts.dart';
import 'package:pokedex_3/core/utils/string_translate.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_event.dart';

class LoginBloc extends Bloc {
  ConstsRoutes routes;
  SignInUseCaseImpl signInUseCaseImpl;

  LoginBloc(this.routes, this.signInUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is LoginEventOnReady) {
      dispatchState(BlocStableState());
    } else if (event is LoginEventNavigate) {
      navigateThenUntil(event.context, routes.registerView);
    } else if (event is LoginEventSignIn) {
      _handleSignIn(event.context, event.params.email, event.params.password);
    }
  }

  _handleSignIn(BuildContext context, String email, String password) async {
    final signInRequest =
        await signInUseCaseImpl.call(UserParams(email, password));

    signInRequest.fold((l) {
      showSnack(context, StringTranslate.convert(l.message), Colors.red);
    }, (r) {
      navigateRemoveUntil(context, routes.homeView);
    });
  }
}
