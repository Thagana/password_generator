import 'package:cyberman/src/add_password/quick_add/view/quick_add_app.dart';
import 'package:cyberman/src/add_password/quick_add/view/quick_add_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuickAddPage extends StatelessWidget {
  const QuickAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const QuickAddWeb() : const QuickAddApp();
  }
}