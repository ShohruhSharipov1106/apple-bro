import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/fullfill_card_page.dart';
import 'package:apple_bro_test/provider/payment_provider.dart';
import 'package:flutter/cupertino.dart';

class YourCardPage extends StatelessWidget {
  const YourCardPage({Key? key}) : super(key: key);

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
          Container(
            height: size.height * 0.2,
            width: size.width,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.black),
              image: const DecorationImage(
                image: AssetImage("assets/icons/frame.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              context.read<PaymentProvider>().cardCapital,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          ButtonFields(
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FullFillCardPage()),
            ),
            "Hamyonni to'ldirish",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }
}
