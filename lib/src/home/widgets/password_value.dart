import 'package:cyberman/constants.dart';
import 'package:cyberman/src/add_password/widgets/status_bars.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordValue extends StatelessWidget {
  const PasswordValue({ super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: secondaryLightColor,
          border: Border.all(
            width: 2,
            color: secondaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<String>(
              stream: context.read<PasswordCubit>().passwordStream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    snapshot.hasData ? snapshot.data! : '',
                    style: GoogleFonts.shareTechMono(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.zero,
                  child: StatusBars(),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: IconButton(
                    icon: const Icon(Icons.rotate_left_rounded),
                    iconSize: 25,
                    color: const Color(0xff00ffff),
                    onPressed: () =>
                    {
                        context.read<PasswordCubit>().updatePassword()
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}