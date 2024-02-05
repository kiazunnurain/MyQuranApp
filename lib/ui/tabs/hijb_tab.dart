import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quran_app/global.dart';

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello, This is Hijb Tab",
        style: GoogleFonts.poppins(
          color: primary,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
