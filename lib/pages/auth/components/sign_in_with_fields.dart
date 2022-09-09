import 'package:apple_bro_test/constants/exports.dart';

// ignore: must_be_immutable
class SignInWithFields extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final function;
  String icon;
  SignInWithFields(this.function, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.17,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: StaticColors.kLightGreyBorderColor, width: 2.0)),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        child: SvgPicture.asset(icon),
        onTap: () => function,
      ),
    );
  }
}
