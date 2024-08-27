import 'package:cyberman/src/profile/views/profile_app.dart';
import 'package:cyberman/src/profile/views/profile_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const ProfileWeb() : const ProfileApp();
  }
}