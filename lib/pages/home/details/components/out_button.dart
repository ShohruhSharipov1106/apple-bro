import 'package:apple_bro_test/constants/exports.dart';

class OutlinButton extends StatelessWidget {
  const OutlinButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: StaticColors.kGreyBorderColor,
        fixedSize: Size(size.width * 0.98, size.height * 0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: const Text(
        "SMS yozish / Qo’ng’iroq",
        style: TextStyle(
          color: StaticColors.kGreyBorderColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
