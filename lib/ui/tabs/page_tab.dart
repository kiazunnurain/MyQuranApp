import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quran_app/global.dart';


class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello, This is Page Tab",
        style: GoogleFonts.poppins(
          color: primary,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
