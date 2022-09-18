import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/add_ads/success_ads.dart';
import 'package:apple_bro_test/pages/home/details/components/out_button.dart';
import 'package:apple_bro_test/pages/profile/fullfill_card_page.dart';
import 'package:flutter/cupertino.dart';

class GiveAdsPage extends StatefulWidget {
  const GiveAdsPage({super.key});

  @override
  State<GiveAdsPage> createState() => _GiveAdsPageState();
}

class _GiveAdsPageState extends State<GiveAdsPage> {
  final List<String> prices = ["6000", "12000", "48000", "60000"];
  int actived = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
        children: [
          const SizedBox(height: 12),
          SizedBox(
            height: height * 0.65,
            child: ListView.builder(
                itemCount: prices.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        actived = index;
                      });
                    },
                    child: Container(
                      width: width,
                      height: height * 0.15,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      padding:
                          const EdgeInsets.only(bottom: 25, top: 19, left: 15),
                      decoration: actived == index
                          ? BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff4285FE),
                                  Color(0xff134EB7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      const Color(0xff000A14).withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prices[index],
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                              color: actived == index
                                  ? Colors.white
                                  : const Color(0xff020202),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "10 kun top    5 kun Topni ichida top",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: actived == index
                                  ? Colors.white
                                  : const Color(0xff5c5c5c),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const Spacer(),
          ButtonFields(
            () {
              actived != 0
                  ? showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        title: const Text("Hisobingiz: 10 800 UZS"),
                        titleTextStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff020202),
                        ),
                        titlePadding: const EdgeInsets.only(top: 40, left: 92),
                        content: const Text(
                          "Hisobingizdagi mablag’ yetarli emas",
                          textAlign: TextAlign.center,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 40),
                        contentTextStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff020202),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: ButtonFields(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FullFillCardPage()),
                              );
                            }, "Hisobni to’ldirish"),
                          ),
                        ],
                      ),
                    )
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessAds()),
                    );
            },
            "E'lon berish",
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
