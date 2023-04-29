import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/utils/container_gradient_widget.dart';
import 'package:pokedex_3/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokedex_3/features/login/presentation/bloc/login_event.dart';

class LoginStableState extends StatefulWidget {
  final BlocState state;
  const LoginStableState({required this.state, super.key});

  @override
  State<LoginStableState> createState() => _LoginStableStateState();
}

class _LoginStableStateState extends State<LoginStableState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late LoginBloc bloc;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    bloc = GetIt.I.get();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerGradientWidget.build(
      Colors.greenAccent,
      Colors.white,
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'PokeDex 3.0',
                style: TextStyle(fontSize: 43, fontWeight: FontWeight.w500),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      width: 260,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'email',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)))),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 260,
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            labelText: 'password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)))),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              bloc.dispatchEvent(LoginEventNavigate(context)),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          child: const Text('Registrar-se'),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        ElevatedButton(
                          onPressed: () => bloc.dispatchEvent(LoginEventSignIn(
                              context,
                              UserParams(emailController.text,
                                  passwordController.text))),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          child: const Text('Login'),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
