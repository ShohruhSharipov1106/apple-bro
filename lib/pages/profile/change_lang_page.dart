import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/components/change_lang_button.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ChangeLangPage extends StatefulWidget {
  const ChangeLangPage({Key? key}) : super(key: key);

  @override
  State<ChangeLangPage> createState() => _ChangeLangPageState();
}

class _ChangeLangPageState extends State<ChangeLangPage> {
  int active = 3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tilni o'zgartirish"),
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
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              active = 1;
              setState(() {});
            },
            child: ChangeLangButton(size: size, "Русский", () {
              setState(() {});
            }, active, 1),
          ),
          GestureDetector(
            onTap: () {
              active = 2;
              setState(() {});
            },
            child: ChangeLangButton(size: size, "Узбек", () {
              setState(() {});
            }, active, 2),
          ),
          GestureDetector(
            onTap: () {
              active = 3;
              setState(() {});
            },
            child: ChangeLangButton(size: size, "O'zbek", () {
              setState(() {});
            }, active, 3),
          ),
        ],
      ),
    );
  }
}
