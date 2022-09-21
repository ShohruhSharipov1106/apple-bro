import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/add_ads/ads_page.dart';
import 'package:apple_bro_test/pages/home/details/components/out_button.dart';
import 'package:flutter/cupertino.dart';

class FinalAdsPage extends StatefulWidget {
  const FinalAdsPage({super.key});

  @override
  State<FinalAdsPage> createState() => _FinalAdsPageState();
}

class _FinalAdsPageState extends State<FinalAdsPage> {
  String adType = "Arxive";
  List<String> adTypes = ["Aktive", "Arxive"];
  List<String> buttonLabel = ["Reklama qilish", "Aktivlashtirish"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profilni tahrirlash"),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Holati",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              _adConditionField(width, height),
              const SizedBox(height: 10),
              SizedBox(
                height: height * 0.75,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xff000A14).withOpacity(0.1)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: height * 0.088,
                                width: width * 0.25,
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: const Border.fromBorderSide(
                                      BorderSide.none),
                                  color: Colors.blue,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/iphone-background.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 8),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Apple iPhone 12 (Green, 64\nGB)\n",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000A14),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "16 000 000 uzs\n",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000A14),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "21.10.2021",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff8d8d8d),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _iconWithLabel(CupertinoIcons.heart),
                              _iconWithLabel(CupertinoIcons.chat_bubble_text),
                              _iconWithLabel(CupertinoIcons.eye),
                              _iconWithLabel(CupertinoIcons.phone_fill),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinButton(
                                    size: MediaQuery.of(context).size,
                                    function: () {
                                      Navigator.pop(context);
                                    },
                                    title: "Tahrirlash"),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ButtonFields(
                                  () {
                                    adType != "Arxive"
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdsPage(),
                                            ),
                                          )
                                        : null;
                                  },
                                  adType == "Arxive"
                                      ? buttonLabel[1]
                                      : buttonLabel[0],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _iconWithLabel(IconData iconData) {
    return Row(
      children: [
        Icon(
          iconData,
          color: const Color(0xffbfbfbf),
          size: 20,
        ),
        const SizedBox(width: 5),
        const Text(
          "155",
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Container _adConditionField(double width, double height) {
    return Container(
      width: width * 0.95,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: const Color(0xff767680).withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          _adCondition(adTypes[0]),
          _adCondition(adTypes[1]),
        ],
      ),
    );
  }

  Expanded _adCondition(String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            adType = text;
          });
        },
        child: Card(
          color: adType == text ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: adType == text ? 1.5 : 0,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
