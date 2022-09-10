import 'package:apple_bro_test/constants/exports.dart';

class EmblemTitle extends StatelessWidget {
  const EmblemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/icons/small-emblem.png"),
        Text(
          "Apple Bro",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
