
import '../../routes/imports.dart';

class CustomTextField extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;
  final TextAlign textAlign; // New property for text alignment

  const CustomTextField({
    Key? key, // Changed super.key to Key? key
    required this.text,
    required this.fontWeight,
    required this.size,
    required this.color,
    this.height = 1.3,
    this.textAlign = TextAlign.left, // Default alignment is left
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, // Set the text alignment
      style: GoogleFonts.montserrat(
        color: color,
        height: height,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
