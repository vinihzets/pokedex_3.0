import 'package:flutter/material.dart';
import 'package:pokedex_3/core/architeture/bloc.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/architeture/event.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_event.dart';

class RegisterBloc extends Bloc {
  SignUpUseCaseImpl signUpUseCaseImpl;

  RegisterBloc(this.signUpUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is RegisterEventOnReady) {
      dispatchState(BlocStableState());
    } else if (event is RegisterEventNavigate) {
      navigatePop(event.context);
    } else if (event is RegisterEventSignUp) {
      _handleSignUp(event.context, event.params.username, event.params.email,
          event.params.password);
    }
  }

  _handleSignUp(
    BuildContext context,
    String username,
    String email,
    String password,
  ) async {
    final signUpRequest =
        await signUpUseCaseImpl.call(RegisterParams(username, email, password));

    signUpRequest.fold((l) {
      dispatchState(BlocErrorState(error: l.message));
    }, (r) {
      showSnack(context, 'Usuario Cadastrado Com Sucesso', Colors.green);
      Future.delayed(const Duration(seconds: 2))
          .then((value) => navigatePop(context));
    });
  }
}
