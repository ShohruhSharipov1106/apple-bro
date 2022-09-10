import 'package:apple_bro_test/constants/exports.dart';

// ignore: must_be_immutable
class TitleField extends StatelessWidget {
  String title;
  TitleField(
    this.title, {
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: StaticColors.kBlackColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        const Text(
          "Barchasi",
          style: TextStyle(
            color: StaticColors.kActiveBorderColor,
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
