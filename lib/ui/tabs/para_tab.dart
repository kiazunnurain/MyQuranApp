import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quran_app/global.dart';

class ParaTab extends StatelessWidget {
  const ParaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello, This is Para Tab",
        style: GoogleFonts.poppins(
          color: primary,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
