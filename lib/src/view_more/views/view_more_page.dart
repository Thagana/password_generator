import 'package:cyberman/constants.dart';
import 'package:cyberman/src/home/blocs/password_bloc/password_bloc.dart';
import 'package:cyberman/src/home/widgets/password_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Passwords',
              style: GoogleFonts.shareTechMono(color: Colors.white),
            ),
            leading: IconButton(
              onPressed: () {
                context.goNamed('home');
              },
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
          ),
          body: ColoredBox(
            color: Colors.black,
            child: Column(
              children: [
                BlocConsumer<PasswordBloc, PasswordState>(
                  listener: (context, state) {
                    if (!state.success) {
                      final snackBar = SnackBar(
                        content: Text(
                          state.errorMessage,
                          style: GoogleFonts.shareTechMono(
                            color: primaryColor,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state.success) {
                      if (state.passwords.isEmpty) {
                        return Center(
                          child: ColoredBox(
                            color: Colors.black,
                            child: Text(
                              'Empty list',
                              style: GoogleFonts.shareTechMono(),
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: [
                          PasswordListView(
                            state: state.passwords,
                          )
                        ],
                      );
                    }
                    return Text(
                      'Failed to load passwords',
                      style: GoogleFonts.shareTechMono(
                        color: primaryColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
