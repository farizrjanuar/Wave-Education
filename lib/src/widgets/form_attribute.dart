import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormAttribute extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isObsecure;

  const FormAttribute({
    required this.title,
    required this.hintText,
    required this.isObsecure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 35, // Tinggi yang diinginkan
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
