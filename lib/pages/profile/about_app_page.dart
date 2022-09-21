import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ilova haqida"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.left_chevron,
              color: StaticColors.kActiveIconColor,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "Sahifa hozircha mavjud emas",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: Color(0xff000A14),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
