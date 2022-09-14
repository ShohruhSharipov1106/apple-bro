import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/components/change_lang_button.dart';
import 'package:apple_bro_test/pages/profile/your_card_page.dart';
import 'package:apple_bro_test/provider/payment_provider.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FullFillCardTypePage extends StatelessWidget {
  FullFillCardTypePage(this.price, {super.key});
  String price;
  List<String> icons = [
    "assets/icons/apelsin.svg",
    "assets/icons/click.svg",
    "assets/icons/payme.svg",
  ];
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
        children: [
          Text(
            "Sizning hamyoningiz",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: const Color(0xff2E2E2E).withOpacity(0.5),
            ),
          ),
          ChangeLangButton(price, () {}, 1, 1, size: size),
          Text(
            "Qanday usulda to'lashni xohlaysiz",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: const Color(0xff2E2E2E).withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: size.height * 0.625,
            width: size.width,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width * 0.8, size.height * 0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        elevation: 0,
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: index == 0
                        ? Image.asset("assets/icons/apelsin.png",
                            fit: BoxFit.cover)
                        : SvgPicture.asset(icons[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          ButtonFields(() {
            context.read<PaymentProvider>().addCash(price);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const YourCardPage()));
          }, "To'ldirish"),
        ],
      ),
    );
  }
}
