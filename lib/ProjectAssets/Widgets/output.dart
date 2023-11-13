import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOutput extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double width;

  const TextOutput({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    this.borderRadius = 5,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
