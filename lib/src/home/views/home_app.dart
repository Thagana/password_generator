import 'package:cyberman/src/home/widgets/copy_password.dart';
import 'package:cyberman/src/home/widgets/header.dart';
import 'package:cyberman/src/home/widgets/password_length_slider.dart';
import 'package:cyberman/src/home/widgets/password_value.dart';
import 'package:cyberman/src/home/widgets/password_variation_option.dart';
import 'package:cyberman/src/home/widgets/passwords_section.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                PasswordValue(),
                CopyPassword(),
                PasswordLengthSlider(),
                PasswordVariationOptions(),
                PasswordsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
