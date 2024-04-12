import 'package:cyberman/constants.dart';
import 'package:cyberman/src/login/cubit/login_form_cubit.dart';
import 'package:cyberman/src/login/cubit/login_page_cubit.dart';
import 'package:cyberman/src/register/widgets/register_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Authentication',
          style: GoogleFonts.shareTechMono(color: primaryColor),
        ),
      ),
      body: Center(
        child: ColoredBox(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: StreamBuilder<String>(
                    stream: context.read<LoginPageCubit>().formStateStream,
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.shareTechMono(
                                    color: primaryColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                                width: 100,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => LoginFormCubit()),
                ],
                child: const RegisterFormContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
