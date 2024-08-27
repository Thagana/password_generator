import 'package:cyberman/src/add_password/blocs/password_bloc/password_bloc.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyPassword extends StatelessWidget {
  const CopyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfffdee00),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          child: Text(
            'Copy and Add Password',
            style: GoogleFonts.shareTechMono(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          onPressed: () async {
            final password = context.read<PasswordCubit>().passwordValue;
            await Clipboard.setData(ClipboardData(text: password));
            // bloc time
            if (!context.mounted) return;
            final strength = context.read<PasswordCubit>().passwordStrength;
            context.read<PasswordBloc>().add(
              RequestSavePassword(
                password: password,
                strength: strength
              ),
            );
          },
        ),
      ),
    );
  }
}
