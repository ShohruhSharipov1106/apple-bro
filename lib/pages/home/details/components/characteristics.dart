import 'package:apple_bro_test/constants/exports.dart';

class Characteristics extends StatelessWidget {
  const Characteristics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: Text(
            "Markasi\n\nChiqarilgan sanasi\n\nRangi\n\nHolati\n\nHududi\n\nBatarekasi",
            style: TextStyle(
              color: StaticColors.kSubtitleColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "MacBook Pro M1\n\n15.08.2021\n\nQora\n\nYangi\n\nKaliforniya\n\n94 %",
            style: TextStyle(
              color: StaticColors.kBlackTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
