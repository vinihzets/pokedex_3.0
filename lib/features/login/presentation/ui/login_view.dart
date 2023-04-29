import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_event.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_empty_state.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_error_state.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_loading_state.dart';
import 'package:pokedex_3/features/login/presentation/ui/login_stable_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(LoginEventOnReady());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('teste');
    return Scaffold(
        body: BlocScreenBuilder(
            stream: bloc.state,
            onStable: (state) => LoginStableState(state: state),
            onError: (state) => LoginErrorState(state: state),
            onLoading: (state) => LoginLoadinState(state: state),
            onEmpty: (state) => const LoginEmptyState()));
  }
}
