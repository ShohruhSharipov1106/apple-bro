import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/components/change_lang_button.dart';
import 'package:apple_bro_test/pages/profile/fullfill_card_type_page.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FullFillCardPage extends StatefulWidget {
  const FullFillCardPage({Key? key}) : super(key: key);

  @override
  State<FullFillCardPage> createState() => _FullFillCardPageState();
}

class _FullFillCardPageState extends State<FullFillCardPage> {
  int active = 5000;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sizning hamyoningiz"),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Sizning hamyoningiz",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xff2E2E2E).withOpacity(0.5),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  active = 5000;
                });
              },
              child: ChangeLangButton("5000", () {}, size: size, active, 5000)),
          GestureDetector(
              onTap: () {
                setState(() {
                  active = 16000;
                });
              },
              child:
                  ChangeLangButton("16000", () {}, size: size, active, 16000)),
          GestureDetector(
              onTap: () {
                setState(() {
                  active = 25000;
                });
              },
              child:
                  ChangeLangButton("25000", () {}, size: size, active, 25000)),
          GestureDetector(
              onTap: () {
                setState(() {
                  active = 45000;
                });
              },
              child:
                  ChangeLangButton("45000", () {}, size: size, active, 45000)),
          GestureDetector(
              onTap: () {
                setState(() {
                  active = 70000;
                });
              },
              child:
                  ChangeLangButton("70000", () {}, size: size, active, 70000)),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ButtonFields(
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FullFillCardTypePage(active.toString()),
                ),
              ),
              "Keyingisi",
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        ],
      ),
    );
  }
}
