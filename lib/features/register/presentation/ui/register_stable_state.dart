import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_3/core/architeture/bloc_state.dart';
import 'package:pokedex_3/core/utils/container_gradient_widget.dart';
import 'package:pokedex_3/features/register/domain/usecases/sign_up_usecase_imp.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_bloc.dart';
import 'package:pokedex_3/features/register/presentation/bloc/register_event.dart';

class RegisterStableState extends StatefulWidget {
  final BlocState state;

  const RegisterStableState({required this.state, super.key});

  @override
  State<RegisterStableState> createState() => _RegisterStableStateState();
}

class _RegisterStableStateState extends State<RegisterStableState> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  late RegisterBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();

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
                'Cadastre-se',
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
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: 'userName',
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
                          onPressed: () => bloc
                              .dispatchEvent(RegisterEventNavigate(context)),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          child: const Text('Login'),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        ElevatedButton(
                          onPressed: () => bloc.dispatchEvent(
                              RegisterEventSignUp(
                                  context,
                                  RegisterParams(
                                      usernameController.text,
                                      emailController.text,
                                      passwordController.text))),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          child: const Text('Registrar-se'),
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
