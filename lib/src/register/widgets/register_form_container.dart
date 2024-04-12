import 'package:cyberman/constants.dart';
import 'package:cyberman/src/login/cubit/login_form_cubit.dart';
import 'package:cyberman/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormContainer extends StatelessWidget {
  const RegisterFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        context.read<LoginFormCubit>().updateLoading();
        if (!state.success) {
          final snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state.success) {
          context.go('/login');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              StreamBuilder<String>(
                stream: context.read<LoginFormCubit>().emailStream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: TextField(
                      controller: emailController,
                      onChanged: (text) {
                        context.read<LoginFormCubit>().updateEmail(text);
                      },
                      style: const TextStyle(color: primaryColor),
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        fillColor: primaryColor,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        hintText: 'Enter email',
                        labelText: 'Enter email',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<String>(
                stream: context.read<LoginFormCubit>().passwordStream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: TextField(
                      controller: passwordController,
                      onChanged: (text) {
                        context.read<LoginFormCubit>().updatePassword(text);
                      },
                      style: const TextStyle(color: primaryColor),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        hintText: 'Enter password',
                        labelText: 'Enter password',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'already have an account? ',
                    style: GoogleFonts.shareTechMono(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => {context.go('/login')},
                    child: Text(
                      'login',
                      style: GoogleFonts.shareTechMono(color: primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<bool>(
                stream: context.read<LoginFormCubit>().isValidForm,
                builder: (context, snapshot) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      label: StreamBuilder<bool>(
                        stream: context.read<LoginFormCubit>().loadingStream,
                        builder: (context, snapshot) {
                          var loading = false;
                          if (snapshot.hasData && snapshot.data != null) {
                            loading = snapshot.data!;
                          }
                          if (!loading) {
                            return Text(
                              'Register',
                              style: GoogleFonts.shareTechMono(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            );
                          }
                          return Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(2),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          );
                        },
                      ),
                      icon: StreamBuilder<bool>(
                        stream: context.read<LoginFormCubit>().loadingStream,
                        builder: (context, snapshot) {
                          var isLoading = false;
                          if (snapshot.hasData && snapshot.data != null) {
                            isLoading = snapshot.data!;
                          }
                          if (isLoading) {
                            Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      onPressed: snapshot.hasData && snapshot.data != null
                          ? () {
                        register(context);
                      }
                          : null,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  void register(BuildContext context) {
    final email = context.read<LoginFormCubit>().emailValue;
    final password = context.read<LoginFormCubit>().passwordValue;
    context.read<RegisterBloc>().add(
      SignUpRequest(email: email, password: password),
    );
    context.read<LoginFormCubit>().updateLoading();
  }
}
