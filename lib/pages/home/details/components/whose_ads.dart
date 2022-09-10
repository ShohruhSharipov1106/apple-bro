import 'package:apple_bro_test/constants/exports.dart';

class WhoseAds extends StatelessWidget {
  const WhoseAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
            radius: 32,
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random")),
        const SizedBox(width: 8),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Kattabekov Jamshidbek\n",
                style: TextStyle(
                  color: StaticColors.kBlackTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Oxirgi online vaqti: 15:30",
                style: TextStyle(
                  color: StaticColors.kSubtitleColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
