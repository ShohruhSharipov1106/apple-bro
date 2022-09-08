import 'package:apple_bro_test/constants/exports.dart';

class EmblemTitle extends StatelessWidget {
  const EmblemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/icons/emblem-title.svg"),
       
      ],
    );
  }
}
