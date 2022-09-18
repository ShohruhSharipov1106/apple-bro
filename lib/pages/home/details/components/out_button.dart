import 'package:apple_bro_test/constants/exports.dart';

class OutlinButton extends StatelessWidget {
  const OutlinButton({
    Key? key,
    required this.size,
    required this.function,
    required this.title,
  }) : super(key: key);

  final Size size;
  final function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: StaticColors.kGreyBorderColor,
        fixedSize: Size(size.width * 0.98, size.height * 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xff8D8D8D)),
        ),
      ),
      onPressed: function,
      child: Text(
        title,
        style: const TextStyle(
          color: StaticColors.kGreyBorderColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
