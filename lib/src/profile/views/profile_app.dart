import 'package:cyberman/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              style: ListTileStyle.list,
              onTap: () {
                //
              },
              title: Text(
                'Settings',
                style: GoogleFonts.shareTechMono(
                  color: primaryColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: primaryColor,
              ),
              leading: const Icon(
                Icons.settings,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              style: ListTileStyle.list,
              onTap: () {
                //
              },
              title: Text(
                'Reminders',
                style: GoogleFonts.shareTechMono(
                  color: primaryColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: primaryColor,
              ),
              leading: const Icon(
                Icons.notifications_none_outlined,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              style: ListTileStyle.list,
              onTap: () {
                //
              },
              title: Text(
                'Export/Import',
                style: GoogleFonts.shareTechMono(
                  color: primaryColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: primaryColor,
              ),
              leading: const Icon(
                Icons.import_export,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              style: ListTileStyle.list,
              onTap: () {
                //
              },
              title: Text(
                'Information',
                style: GoogleFonts.shareTechMono(
                  color: primaryColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: primaryColor,
              ),
              leading: const Icon(
                Icons.info_outline,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
