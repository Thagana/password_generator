import 'package:cyberman/constants.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordVariationOptions extends StatelessWidget {
  const PasswordVariationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<bool>(
                    stream:
                        context.read<PasswordCubit>().isUpperCaseOptionStream,
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: snapshot.hasData ? snapshot.data : false,
                            onChanged: (bool? value) {
                              context
                                  .read<PasswordCubit>()
                                  .updateIsUpperCaseOption(value);
                            },
                          ),
                          Text(
                            'Uppercase',
                            style: GoogleFonts.shareTechMono()!
                                .copyWith(color: primaryColor, fontSize: 15),
                          ),
                        ],
                      );
                    },
                  ),
                  StreamBuilder<bool>(
                    stream: context.read<PasswordCubit>().isNumberOptionStream,
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: snapshot.hasData ? snapshot.data : false,
                            onChanged: (bool? value) {
                              context
                                  .read<PasswordCubit>()
                                  .updateIsNumericOption(value);
                            },
                          ),
                          Text(
                            'Numbers',
                            style: GoogleFonts.shareTechMono()
                                .copyWith(color: primaryColor, fontSize: 15),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<bool>(
                    stream:
                        context.read<PasswordCubit>().isLowerCaseOptionStream,
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: snapshot.hasData ? snapshot.data : false,
                            onChanged: (bool? value) {
                              context
                                  .read<PasswordCubit>()
                                  .updateIsLowerCaseOption(value);
                            },
                          ),
                          Text(
                            'Lowercase',
                            style: GoogleFonts.shareTechMono()!
                                .copyWith(color: primaryColor, fontSize: 15),
                          ),
                        ],
                      );
                    },
                  ),
                  StreamBuilder<bool>(
                    stream: context.read<PasswordCubit>().isSymbolOptionStream,
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: snapshot.hasData ? snapshot.data : false,
                            onChanged: (bool? value) {
                              context
                                  .read<PasswordCubit>()
                                  .updateIsSymbolOption(value);
                            },
                          ),
                          Text(
                            'Symbols',
                            style: GoogleFonts.shareTechMono()
                                .copyWith(color: primaryColor, fontSize: 15),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
