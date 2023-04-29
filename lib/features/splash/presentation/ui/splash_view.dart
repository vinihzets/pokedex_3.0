import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:pokedex_3/features/splash/presentation/bloc/splash_event.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(SplashEventAuthentication(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
