import 'package:cyberman/src/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const WebHome() : const HomeApp();
  }
}
