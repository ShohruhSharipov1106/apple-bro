import 'package:apple_bro_test/constants/exports.dart';

// ignore: must_be_immutable
class ButtonFields extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final function;
  String title;
  ButtonFields(this.function, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width * 0.88, size.height * 0.05),
          backgroundColor: StaticColors.kBlueButtonColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: function,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
