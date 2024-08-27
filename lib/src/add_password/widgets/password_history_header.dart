import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordHistoryHeader extends StatelessWidget {
  const PasswordHistoryHeader({ super.key });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Password history',
        style: GoogleFonts.shareTechMono(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}