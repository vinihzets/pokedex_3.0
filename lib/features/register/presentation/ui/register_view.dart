import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/components/bloc_screen_builder.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_bloc.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_event.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_empty_state.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_error_state.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_loading_state.dart';
import 'package:pokedex_3/features/register/presentation/ui/register_stable_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(RegisterEventOnReady());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocScreenBuilder(
          stream: bloc.state,
          onStable: (state) => RegisterStableState(state: state),
          onError: (state) => RegisterErrorState(state: state),
          onLoading: (state) => RegisterLoadingState(state: state),
          onEmpty: (state) => RegisterEmptyState(state: state)),
    );
  }
}
