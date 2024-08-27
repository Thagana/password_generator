import 'package:cyberman/src/add_password/widgets/copy_password.dart';
import 'package:cyberman/src/add_password/widgets/password_length_slider.dart';
import 'package:cyberman/src/add_password/widgets/password_variation_option.dart';
import 'package:cyberman/src/home/widgets/password_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickAddApp extends StatelessWidget {
  const QuickAddApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: const Column(
            children: [
              PasswordValue(),
              PasswordLengthSlider(),
              PasswordVariationOptions(),
              CopyPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
