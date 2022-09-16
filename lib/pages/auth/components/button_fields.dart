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

    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff699FFF),
              Color(0xff134EB7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        width: size.width * 0.92,
        height: size.height * 0.05,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
