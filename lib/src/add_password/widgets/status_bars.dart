import 'package:cyberman/src/home/widgets/status_bar.dart';
import 'package:cyberman/src/home/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusBars extends StatelessWidget {
  const StatusBars({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PasswordStrength>(
      stream: context.read<PasswordCubit>().passwordStrengthStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
          switch(snapshot.data) {
            case PasswordStrength.WEEK:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                ],
              );
            case PasswordStrength.MEDIUM:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                ],
              );
            case PasswordStrength.STRONG:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                  StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
                ],
              );
            default:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                  StatusBar(color: Colors.yellow),
                ],
              );
          }
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusBar(color: Colors.yellow),
              StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
              StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
              StatusBar(color: Color.fromARGB(255, 2, 83, 5)),
            ],
          );
        }
      },
    );
  }
}
