import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_project/Utils/app_colors.dart';

class IconTextWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String iconText;
  const IconTextWidget(
      {super.key,
      required this.icon,
      required this.iconText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: accentColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              iconText,
              style: GoogleFonts.mukta(
                  color: accentColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }
}
