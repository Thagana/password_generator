import 'package:cyberman/constants.dart';
import 'package:cyberman/src/home/blocs/password_bloc/password_bloc.dart';
import 'package:cyberman/src/home/widgets/password_history_header.dart';
import 'package:cyberman/src/home/widgets/password_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordsSection extends StatelessWidget {
  const PasswordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return                   SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const PasswordHistoryHeader(),
            const SizedBox(
              height: 15,
            ),
            Column(
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
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
                              style: GoogleFonts.shareTechMono(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              TextButton(
                                onPressed: () {
                                  context.go('/passwords');
                                },
                                child: Text(
                                  'View More',
                                  style:
                                  GoogleFonts.shareTechMono(
                                    color: secondaryColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
          ],
        ),
      ),
    );
  }
}