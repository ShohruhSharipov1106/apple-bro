import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/details/components/out_button.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';
import 'package:apple_bro_test/pages/profile/fullfill_card_page.dart';
import 'package:flutter/cupertino.dart';

class SuccessAds extends StatelessWidget {
  const SuccessAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reklama berish"),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 57),
          Image.asset("assets/images/success-ads-background.png"),
          const SizedBox(height: 40),
          const Text(
            "E’lon admin tarafidan\nko’rib chiqilayapti",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff000A14),
            ),
          ),
          const Spacer(),
          ButtonFields(
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            "Bosh sahifaga qaytish",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: OutlinButton(
              size: MediaQuery.of(context).size,
              function: () {
                Navigator.pop(context);
              },
              title: "Orqaga",
            ),
          ),
        ],
      ),
    );
  }
}
